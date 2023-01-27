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
    #  vi 편집기에서 파일을 열고 "Options"을 검색
    vi +/Options "$file"
    # "Options Indexes"을 "Options"으로 바꾸기
    :%s/Options Indexes/Options/g
    # 파일 저장 후 종료
    :wq
else
    echo "httpd.conf file not found in /[Apache_home]/conf/"
fi




cat $result

echo ; echo