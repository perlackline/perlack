#!/usr/bin/perl

use strict;
use warnings;

use utf8;
use Unicode::Normalize;
#use charnames qw(:full);

# U+FB01        - 合字 fi 
# fi
# fi
# U+0065 U+0301 - 分解形の e (e の上にダッシュ) 
# é
# U+00E9        - 合成形の e (e の上にダッシュ) 
# é
# U+0061 U+0308
# ä
# U+00E4
# ä

binmode STDOUT, ':utf8';

sub output {

  # 引数の書記素を格納
  my $str = shift;

  # 正規化しつつアイテムセット
  my @nf_name  = qw(RAW NFD NFC NFKD NfKC);
  my @nf_value = ($str, NFD($str), NFC($str), NFKD($str), NFKC($str));

  # 無名ハッシュにスライスで key/value アイテムをセット
  my $nf = {};
  @${nf}{ @nf_name } = @nf_value; 

  # 出力
  map {
        # key : value
        print "$_ :\t$nf->{$_}\t";

        # value をコードポイントに変換して格納
        my @codes = map { 
                          #デバッグ
                          #print "*$_*";

                          # コードポイント変換
                          sprintf "%04x", unpack("U", $_)

                          # 分解された value に対する split
                        } split //, $nf->{$_};

        # コードポイントを出力
        print join(',', @codes), "\n";

        # デリファレンスしたハッシュの key をソート
      } sort (keys %$nf);
}


my $composed   = "\x{00E9}"; 
my $decomposed = "\x{0065}\x{0301}";
my $ligature   = "\x{FB01}";
print "composed   : $composed\n";
print "decomposed : $decomposed\n";
print "ligature   : $ligature\n";

print "---\n";
output ($composed);
print "---\n";
output ($decomposed);
print "---\n";

