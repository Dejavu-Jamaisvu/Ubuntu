#!/bin/bash

. function.sh

BAR

CODE [U-01] root 계정 원격 접속 제한

cat << EOF >> $result

[양호]: 원격 서비스를 사용하지 않거나 사용시 직접 접속을 차단한 경우

[취약]: root 직접 접속을 허용하고 원격 서비스를 사용하는 경우

EOF

BAR



# Open the file in nano
sudo nano /etc/login.defs

# Prompt the user to enter their minimum password length
echo "Enter the minimum password length:"
read -r min_len

# Search for the line containing "PASS_MIN_LEN" and set its value to the entered minimum length
sed -i "s/^PASS_MIN_LEN.*/PASS_MIN_LEN $min_len/" /etc/login.defs

# Save and exit the file
:wq


cat $result

echo ; echo