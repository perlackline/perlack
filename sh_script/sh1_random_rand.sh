set -u
umask 0022
PATH='/usr/bin:/bin'
IFS=$(printf ' \t\n_'); IFS=${IFS%_}
export IFS LC_ALL=C LANG=C PATH

#---
# AWK の srand(), rand() を利用した乱数生成
#---
for n in 1 2 3 4 5;
do
  #awk 'BEGIN{srand();print rand();}';
  awk 'BEGIN{print rand();}';
  sleep 1;
done

# ただし FreeBSD の場合は random() の利用が必要.
# (デフォルトの rand() ではあまり乱数にならないため)
# * Linux のrand() と srand() は内部的に random() になっている.
