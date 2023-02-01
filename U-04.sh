#!/bin/bash

. function.sh

BAR

CODE [U-04] 패스워드 파일 보호

cat << EOF >> $result

[양호]: PATH 환경변수에 “.” 이 맨    앞이나 중간에 포함되지 않은 경우

[취약]: PATH 환경변수에 “.” 이 맨    앞이나 중간에 포함되어 있는 경우

EOF

BAR


##고민필요


cat $result

echo ; echo