#!/bin/bash

. function.sh

BAR

CODE [U-01] root 계정 원격 접속 제한

cat << EOF >> $result

[양호]: 원격 서비스를 사용하지 않거나 사용시 직접 접속을 차단한 경우

[취약]: root 직접 접속을 허용하고 원격 서비스를 사용하는 경우

EOF

BAR

#@@@@@@@@@@@@@@@@@@@@@@@조치를 어떻게 하는 지 확인필요@@@@@@@@@@@@@@@@
# (불필요한 파일네임을 확인해야함)
# Remove SUID and SGID permissions from main executable
file_name="/usr/bin/main"
chmod -s $file_name


# 주기적인 감사방법 (굳이 와일문, sleep 써야하는지 확인 한번더)
while true
do
    # Find all files owned by root with SUID or SGID bit set
    find / -xdev -user root \( -perm -04000 -o -perm -02000 \) -type f -exec ls -al {} \;

    # Sleep for a day
    sleep 86400
done


# 반드시 사용이 필요한 경우 특정 그룹에서만 사용하도록 제한하는 방법
# (아래 변수는 사용자에게 입력받아서 그룹이름이랑 해당 파일을 )
setuid_file_name="/usr/bin/setuid_file"
allowed_group="sudo"

# Change the group of the setuid file to the allowed group
/usr/bin/chgrp $allowed_group $setuid_file_name

# Change the permissions of the setuid file to allow execution by owner and the allowed group, and disallow others
/usr/bin/chmod 4750 $setuid_file_name



cat $result

echo ; echo