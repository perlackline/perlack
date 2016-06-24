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
file=$@;
while :; do
  # 1) ls コマンドで属性とファイルサイズを取得
  s=$(ls -adl "$file" 2>/dev/null) || {
    printf '%s: cannot open file "%s" (Permission denied)\n' "${0##*/}" "$file" 1>&2
    exit 1
  }
  # 2) ls が返した文字列を要素ごとに分割
  set -- $s # 属性は $1 , ファイルサイズは $5 に格納される

  # 3) 実ファイルを見つけるループ
  #    ・'') 見つからなければエラー
  #    ・-*) 通常ファイルならループ終了
  #    ・l*) リンクならパスを調べて再ループ
  #    ・*) それ以外のファイルはエラー終了

  case "$1" in
    '') printf '%s: $%s: No such file or directory\n' "${0##*/}" "$file" 1>&2
        exit 1
        ;;
    -*) break
        ;;
    l*) s=$(printf '%s' "$file"     |
        sed 's/\([].\*/[]\)/\\\1/g' |
        sed 's/^\^/\\^/'            |
        sed 's/\$$/\\$/'            )
        srcfile=$(file "$file"                         |
             sed 's/^.\{'"$s"'\}: symbolic link to //' |

             sed 's/^`\(.*\)'"'"'$/\1/'                )
        case "$srcfile" in
          /*) file=$srcfile ;;
           *) file="${file%/*}/$srcfile";;
        esac
        continue
        ;;
     *) printf '%s\n' "${0##*/}: \`$file' is not a regular file." 1>&2
        exit 1
        ;; 
  esac
done 

#file=$(readlink -f $file);

printf "%s\n" $file;
#cat $file;
#for file in $@; do
# printf "%s\n" $file;
#done;
