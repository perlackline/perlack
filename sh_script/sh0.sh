# set シェルのオプション設定
# -u 未定義変数の参照でエラーメッセージ
set -u
# umask 0022 = 666 - 022 = 644
umask 0022
PATH='/usr/bin:/bin'
# IFS デリミタの環境変数
# 空文字, タブ, 改行をデリミタに設定
# - IFS=${IFS%_} は ${var%pattern} というシェル変数で
#   pattern が最小マッチングで切り落とされる.
# - $() で末尾の改行文字が取り除かれないようにするテクニック (P.59)
IFS=$(printf ' \t\n_'); IFS=${IFS%_}

# 各環境変数をセット
# ロケール (e.g. LC*, LANG*) により
# 動作がことなるコマンドがあるためこれも一時的にセットする
export IFS LC_ALL=C LANG=C PATH


