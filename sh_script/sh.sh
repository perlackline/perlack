#!/bin/sh

# set シェルのオプション設定
# -u 未定義変数の参照でエラーメッセージ
set -u
# umask 0022 = 666 - 022 = 644
umask 0022
PATH='/usr/bin:/bin'
# IFS デリミタの環境変数
# 空文字, タブ, 改行をデリミタに設定
IFS=$(printf ' \t\n_'); IFS=${IFS%_}
# - IFS=${IFS%_} は ${var%pattern} というシェル変数で
#   pattern が最小マッチングで切り落とされる.
#   通常は以下でよい ?
#   ---
#   IFS=$(printf ' \t\n');
#   ---

# 各環境変数をセット
export IFS LC_ALL=C LANG=C PATH

#---
cat <<TEXT > foo.txt
a
    b
c
TEXT

cat foo.txt |
awk '{print NR,$0}' | # 行頭に行番号
sort -k 1nr,1 #|       # 行番号降順ソート
#sed 's/^[0-9]* //'    # 行番号の削除

