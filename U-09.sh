#!/bin/bash

. function.sh

BAR

CODE [U-01] root 계정 원격 접속 제한

cat << EOF >> $result

[양호]: 원격 서비스를 사용하지 않거나 사용시 직접 접속을 차단한 경우

[취약]: root 직접 접속을 허용하고 원격 서비스를 사용하는 경우

EOF

BAR


# Change owner and group to root
sudo chown root:root /etc/inetd.conf

# Change permissions to 600 (read-write for owner only)
sudo chmod 600 /etc/inetd.conf


#LINUX - xinetd
# Change owner and group to root
sudo chown root:root /etc/xinetd.conf

# Change permissions to 600 (read-write for owner only)
sudo chmod 600 /etc/xinetd.conf

# 하위파일..

cat $result

echo ; echo