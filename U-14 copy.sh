#!/bin/bash

. function.sh

BAR

CODE [U-01] root 계정 원격 접속 제한

cat << EOF >> $result

[양호]: 원격 서비스를 사용하지 않거나 사용시 직접 접속을 차단한 경우

[취약]: root 직접 접속을 허용하고 원격 서비스를 사용하는 경우

EOF

BAR

#@@@@@@@@@@@@@@@@@@@@@@@조치해야하는 파일을 받아오는 방법 확인 필요@@@@@@@@@@@@@@@@
#!/bin/bash

# File to check
file_name="/path/to/user" ##@@카피파일

# Home directory environment variable file
home_dir_file="/etc/environment"

# New owner
new_owner="username"

# Check if the home directory file is owned by root
if [ "$(stat -c %U $home_dir_file)" == "root" ]; then
  # Check if a non-owner has write permission
  if [ -w $file_name ] && [ "$(stat -c %U $file_name)" != "root" ]; then
    # Change the owner of the file
    chown $new_owner $file_name
    echo "Owner of $file_name changed to $new_owner"
  else
    echo "A non-root user does not have write permission on $file_name"
  fi
else
  echo "The owner of the home directory environment variable file is not root"
fi


cat $result

echo ; echo