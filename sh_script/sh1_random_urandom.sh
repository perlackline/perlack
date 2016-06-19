set -u
umask 0022
PATH='/usr/bin:/bin'
IFS=$(printf ' \t\n_'); IFS=${IFS%_}
export IFS LC_ALL=C LANG=C PATH

#---
# /dev/urandom を利用した乱数生成
#---
for n in 1 2 3 4 5;
do
  od -A n -t u4 -N 4 /dev/urandom | sed 's/[^0-9]//g';
  sleep 1;
done

