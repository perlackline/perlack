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

localvar_sample(){
  (
    a=$(whoami)
    b='My name is'
    c=$(awk -v id=$a -F : '$1==id{print $5}' /etc/passwd)
    echo "$b $c."
  )
}

localvar_sample

