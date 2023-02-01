#!/bin/bash

. function.sh

BAR

CODE [U-01] root 계정 원격 접속 제한

cat << EOF >> $result

[양호]: 원격 서비스를 사용하지 않거나 사용시 직접 접속을 차단한 경우

[취약]: root 직접 접속을 허용하고 원격 서비스를 사용하는 경우

EOF

BAR



file="/etc/services"

# Check if file exists
if [ -e $file ]; then
  # Change ownership to root
  sudo chown root:root $file
  # Change permissions to 644
  sudo chmod 644 $file
  echo "File ownership and permissions set to root:root and 644"
else
  echo "File does not exist"
fi


cat $result

echo ; echo