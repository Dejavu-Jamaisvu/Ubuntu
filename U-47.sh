#!/bin/bash

. function.sh

BAR

CODE [U-47] 패스워드 최대 사용기간 설정

cat << EOF >> $result

[양호]: 패스워드 최대 사용기간이 90일(12주) 이하로 설정되어 있는 경우

[취약]: 패스워드 최대 사용기간이 90일(12주) 이하로 설정되어 있지 않는 경우

EOF

BAR



# 파일Open
sudo nano /etc/login.defs

# 사용자에게 최대 사용 기간(일)을 입력하라는 메시지 표시
echo "Enter the maximum age (in days) for user's password:"
read -r max_days

# "PASS_MAX_DAYS"가 포함된 줄을 검색하고 입력된 최대 일 수로 값을 설정
sed -i "s/^PASS_MAX_DAYS.*/PASS_MAX_DAYS $max_days/" /etc/login.defs

# 파일 저장 후 종료
:wq


cat $result

echo ; echo