#!/bin/bash

. function.sh

BAR

CODE [U-45] root 계정 su 제한

cat << EOF >> $result

[양호]: su 명령어를 특정 그룹에 속한 사용자만 사용하도록 제한되어 있는 경우 
※ 일반사용자 계정 없이 root 계정만 사용하는 경우 su 명령어 사용제한 불필요

[취약]: su 명령어를 모든 사용자가 사용하도록 설정되어 있는 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  

# 휠 그룹이 이미 존재하는지 점검하
if grep -q '^wheel:' /etc/group; then
  echo "wheel group already exists"
else
  # 휠 그룹 생성
  sudo groupadd wheel
  echo "wheel group created"
fi

# su 명령 그룹을 휠로 변경
sudo chgrp wheel /usr/bin/su

# su 명령의 권한을 4750으로 변경
sudo chmod 4750 /usr/bin/su

# 휠 그룹이 이미 존재하는지 점검
if grep -q '^wheel:' /etc/group; then
  # 휠 그룹에 su 명령 추가
  sudo usermod -a -G wheel $(whoami)
else
  echo "wheel group does not exist"
fi
#@@@@@@@@@@2@LINUX PAM 모듈을 이용한 설정 방법도 추가할지 고민@@@@@@@@@


cat $result

echo ; echo