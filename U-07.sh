#!/bin/bash

. function.sh

BAR

CODE [U-07] /etc/passwd 파일 소유자 및 권한 설정

cat << EOF >> $result

[양호]: /etc/passwd 파일의 소유자가 root이고, 권한이 644 이하인 경우

[취약]: /etc/passwd 파일의 소유자가 root가 아니거나, 권한이 644 이하가 아닌 
경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  

#
sudo chown root:root /etc/passwd

#
sudo chmod 644 /etc/passwd



cat $result

echo ; echo