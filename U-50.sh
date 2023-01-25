#!/bin/bash

. function.sh

BAR

CODE [U-01] root 계정 원격 접속 제한

cat << EOF >> $result

[양호]: 원격 서비스를 사용하지 않거나 사용시 직접 접속을 차단한 경우

[취약]: root 직접 접속을 허용하고 원격 서비스를 사용하는 경우

EOF

BAR


# 90일동안 사용하지 않은 계정을 검색
# Get the list of all users that haven't logged in for more than 90 days
users=$(lastlog -b 90 -t | cut -d' ' -f1 | grep -v 'Username' | grep -v 'root' | grep -v 'Never logged in')

# Loop through the list of users and remove them
for user in $users; do
  echo "Removing user $user..."
  userdel -r $user
done



cat $result

echo ; echo