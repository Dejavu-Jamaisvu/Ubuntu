#!/bin/bash

. function.sh

BAR

CODE [U-01] root 계정 원격 접속 제한

cat << EOF >> $result

[양호]: 원격 서비스를 사용하지 않거나 사용시 직접 접속을 차단한 경우

[취약]: root 직접 접속을 허용하고 원격 서비스를 사용하는 경우

EOF

BAR


# Change ownership of /etc/hosts.equiv to root
sudo chown root /etc/hosts.equiv

# Change ownership of $HOME/.rhosts to <user_name>
sudo chown <user_name> $HOME/.rhosts




# Change permissions of /etc/hosts.equiv to 600 or less
sudo chmod 600 /etc/hosts.equiv

# Change permissions of $HOME/.rhosts to 600 or less
sudo chmod 600 $HOME/.rhosts



#@@@@@@@@@@@@@@@@@@@@@@@이스크립트 맞는지 확인필요@@@@@@@@@@@@@@@@@@@@@@
# remove "+" from /etc/hosts.equiv
sed -i '/^+/d' /etc/hosts.equiv

# remove "+" from $HOME/.rhosts
sed -i '/^+/d' $HOME/.rhosts

# add allowed host to /etc/hosts.equiv
echo "host1" >> /etc/hosts.equiv
echo "host2" >> /etc/hosts.equiv

# add allowed account to $HOME/.rhosts
echo "account1" >> $HOME/.rhosts
echo "account2" >> $HOME/.rhosts


cat $result

echo ; echo