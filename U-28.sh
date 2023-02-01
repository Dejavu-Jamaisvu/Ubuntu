#!/bin/bash

. function.sh

BAR

CODE [U-28] NIS, NIS+ 점검

cat << EOF >> $result

[양호]: NIS 서비스가 비활성화 되어 있거나, 필요 시 NIS+를 사용하는 경우

[취약]: NIS 서비스가 활성화 되어 있는 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  

# backup original inetd.conf
cp /etc/inetd.conf /etc/inetd.conf.bak

# add annotations for tftp, talk, and ntalk services
sed -i 's/^tftp.*/\# tftp service\ntftp/' /etc/inetd.conf
sed -i 's/^talk.*/\# talk service\ntalk dgram udp wait root /usr/sbin/tcpd in.talkd/' /etc/inetd.conf
sed -i 's/^ntalk.*/\# ntalk service\nntalk dgram udp wait root /usr/sbin/tcpd in.ntalkd/' /etc/inetd.conf

# restart inetd daemon
/etc/init.d/inetd restart



cat $result

echo ; echo