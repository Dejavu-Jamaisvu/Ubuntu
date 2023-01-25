#!/bin/bash

. function.sh

BAR

CODE [U-01] root 계정 원격 접속 제한

cat << EOF >> $result

[양호]: 원격 서비스를 사용하지 않거나 사용시 직접 접속을 차단한 경우

[취약]: root 직접 접속을 허용하고 원격 서비스를 사용하는 경우

EOF

BAR



# Define the Apache config file
file="/[Apache_home]/conf/httpd.conf"

# Check if the file exists
if [ -f "$file" ]; then
    # Open the file in vi editor and search for "Options"
    vi +/Options "$file"
    # Replace "Options Indexes" with "Options"
    :%s/Options Indexes/Options/g
    # Save and quit the file
    :wq
else
    echo "httpd.conf file not found in /[Apache_home]/conf/"
fi




cat $result

echo ; echo