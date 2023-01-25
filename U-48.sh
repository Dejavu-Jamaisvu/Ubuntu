#!/bin/bash

. function.sh

BAR

CODE [U-48] 패스워드 최소 사용기간 설정

cat << EOF >> $result

[양호]: 패스워드 최소 사용기간이 1일 이상 설정되어 있는 경우

[취약]: 패스워드 최소 사용기간이 설정되어 있지 않는 경우

EOF

BAR




# Open the file in nano
sudo nano /etc/login.defs

# Prompt the user to enter the minimum age (in days)
echo "Enter the minimum age (in days) for user's password:"
read -r min_days

# Search for the line containing "PASS_MIN_DAYS" and set its value to the entered minimum days
sed -i "s/^PASS_MIN_DAYS.*/PASS_MIN_DAYS $min_days/" /etc/login.defs

# Save and exit the file
:wq


cat $result

echo ; echo