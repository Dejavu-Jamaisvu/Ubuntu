#!/bin/bash

. function.sh

BAR

CODE [U-01] root 계정 원격 접속 제한

cat << EOF >> $result

[양호]: 원격 서비스를 사용하지 않거나 사용시 직접 접속을 차단한 경우

[취약]: root 직접 접속을 허용하고 원격 서비스를 사용하는 경우

EOF

BAR

# Apache 구성 파일 정의
file="/[Apache_home]/conf/httpd.conf"

# 파일이 있는지 확인
if [ -f "$file" ]; then
    # vi 편집기에서 파일을 열고 "AllowOverride"를 검색
    vi +/AllowOverride "$file"
    # "AllowOverrideNone"을 "AllowOverride AuthConfig"로 바꿈
    :%s/AllowOverride None/AllowOverride AuthConfig/g
    # 파일 저장 후 종료
    :wq
else
    echo "httpd.conf file not found in /[Apache_home]/conf/"
fi

# 사용자에게 디렉토리 경로를 입력하라는 메시지 표시
echo "Enter the path of the directory where you want to set user authentication:"
read -r dir_path

# 지정된 디렉토리에 .htaccess 파일 생성
touch $dir_path/.htaccess

# .htaccess 파일에 인증 설정 추가
echo "AuthName \"Authenticate Directory Users\"" >> $dir_path/.htaccess
echo "AuthType Basic" >> $dir_path/.htaccess
echo "AuthUserFile /usr/local/apache/test/.auth" >> $dir_path/.htaccess
echo "Require valid-user" >> $dir_path/.htaccess


# 사용자에게 ID 입력을 요청
echo "Enter the ID for user authentication:"
read -r id

# 사용자에게 암호를 입력하라는 메시지 표시
echo "Enter the password for user authentication:"
read -s pass

# htpasswd를 사용하여 ID 및 암호 생성
sudo htpasswd -c /usr/local/apache/test/.auth $id <<< $pass


# Apache 데몬을 재시작하여 변경된 설정 적용
sudo service apache2 restart


cat $result

echo ; echo