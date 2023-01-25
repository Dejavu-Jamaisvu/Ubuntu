#!/bin/bash

. function.sh

BAR

CODE [U-46] 패스워드 최소 길이 설정

cat << EOF >> $result

[양호]: 패스워드 최소 길이가 8자 이상으로 설정되어 있는 경우 

[취약]: 패스워드 최소 길이가 8자 미만으로 설정되어 있는 경우 

EOF

BAR

# 파일 Open 
sudo nano /etc/login.defs

# 사용자에게 최소 암호 길이를 입력하라는 메시지 표시
echo "Enter the minimum password length:"
read -r min_len

# "PASS_MIN_LEN"이 포함된 라인을 검색하고 입력된 최소 길이로 값을 설정
sed -i "s/^PASS_MIN_LEN.*/PASS_MIN_LEN $min_len/" /etc/login.defs

# 파일 저장 후 종료
:wq

cat $result

echo ; echo