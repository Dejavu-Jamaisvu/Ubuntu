#!/bin/bash

. function.sh

BAR

CODE [U-47] 패스워드 최대 사용기간 설정

cat << EOF >> $result

[양호]: 패스워드 최대 사용기간이 90일(12주) 이하로 설정되어 있는 경우

[취약]: 패스워드 최대 사용기간이 90일(12주) 이하로 설정되어 있지 않는 경우

EOF

BAR



# Open the file in nano
sudo nano /etc/login.defs

# Prompt the user to enter the maximum age (in days)
echo "Enter the maximum age (in days) for user's password:"
read -r max_days

# Search for the line containing "PASS_MAX_DAYS" and set its value to the entered maximum days
sed -i "s/^PASS_MAX_DAYS.*/PASS_MAX_DAYS $max_days/" /etc/login.defs

# Save and exit the file
:wq


cat $result

echo ; echo