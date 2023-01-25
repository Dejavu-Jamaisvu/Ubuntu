#!/bin/bash

. function.sh

BAR

CODE [U-46] 패스워드 최소 길이 설정

cat << EOF >> $result

[양호]: 패스워드 최소 길이가 8자 이상으로 설정되어 있는 경우 

[취약]: 패스워드 최소 길이가 8자 미만으로 설정되어 있는 경우 

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