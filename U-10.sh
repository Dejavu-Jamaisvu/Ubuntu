#!/bin/bash

. function.sh

BAR

CODE [U-01] root 계정 원격 접속 제한

cat << EOF >> $result

[양호]: 원격 서비스를 사용하지 않거나 사용시 직접 접속을 차단한 경우

[취약]: root 직접 접속을 허용하고 원격 서비스를 사용하는 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  


file="/etc/inetd.conf"

# Check if file exists
if [ -e $file ]; then
  # Change ownership to root
  sudo chown root:root $file
  # Change permissions to 600
  sudo chmod 600 $file
  echo "File ownership and permissions set to root:root and 600"
else
  echo "File does not exist"
fi

file="/etc/xinetd.conf"

# Check if file exists
if [ -e $file ]; then
  # Change ownership to root
  sudo chown root:root $file
  # Change permissions to 600
  sudo chmod 600 $file
  echo "File ownership and permissions set to root:root and 600"
else
  echo "File does not exist"
fi


cat $result

echo ; echo