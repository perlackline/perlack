set -u
umask 0022
PATH='/usr/bin:/bin'
IFS=$(printf ' \t\n_'); IFS=${IFS%_}
export IFS LC_ALL=C LANG=C PATH

#---
# ps コマンドの PID, 実行時間, CPU 使用率, メモリ使用量を利用する
#---

# /dev/urandom を使いたくない場合

# sed で改行を扱う定義
LF=$(printf '\\\n_');LF=${LF%_}

for n in 1 2 3 4 5;
do
  # 乱数源 (プロセス情報一覧 + 日時)
  (ps -Ao pid,etime,pcpu,vsz; date) |
  # 数値化する
  od -t d4 -A n -v |
  sed 's/[^0-9]\{1,\}/'"$LF"'/g' |
  grep '[0-9]' |
  # 100000000 未満の数値を 42 個まで用意 (2^32 未満にするため)
  tail -n 42 |
  sed 's/.*\(.\{8\}\)$/\1/g' |
  # 上の値を足して signed long 値を作る
  awk 'BEGIN{a=-2147483648;}
      {a+=$1;}
      END{srand(a);print rand();}'
done

