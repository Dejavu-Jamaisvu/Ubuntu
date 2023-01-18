#!/bin/bash

. function.sh

BAR

CODE [U-01] root 계정 원격 접속 제한

cat << EOF >> $result

[양호]: 원격 서비스를 사용하지 않거나 사용시 직접 접속을 차단한 경우

[취약]: root 직접 접속을 허용하고 원격 서비스를 사용하는 경우

EOF

BAR




# Comment out the finger service line in /etc/inetd.conf
sed -i 's/^finger/#finger/' /etc/inetd.conf




# Get the PID of the inetd service
pid=$(pgrep inetd)

# Send a HUP signal to the inetd service to reload its configuration
kill -HUP $pid

# Verify that the inetd service has been restarted
if pgrep inetd; then
  echo "inetd service restarted successfully"
else
  echo "inetd service failed to restart"
fi




##@@@xinetd 경우 해야함!!!!!!11



cat $result

echo ; echo