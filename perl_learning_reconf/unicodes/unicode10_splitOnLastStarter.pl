#!/usr/bin/perl

use strict;
use warnings;

use utf8;
#use Unicode::Normalize;
use Unicode::Normalize qw(splitOnLastStarter compose reorder NFD NFC NFKD NFKC FCD FCC);
#use charnames qw(:full);

binmode STDOUT, ':utf8';

sub output {
  # 引数の書記素を格納
  my $str = shift;
  # 正規化しつつアイテムセット
  my @nf_name  = qw(RAW NFD NFC NFKD NfKC FCD FCC);
  my @nf_value = ($str, NFD($str), NFC($str), NFKD($str), NFKC($str), FCD($str), FCC($str));
  # 無名ハッシュにスライスで key/value アイテムをセット
  my $nf = {};
  @${nf}{ @nf_name } = @nf_value; 

  # 出力
  map {
        my @strings;
        # key : value
        print "$_ :\t$nf->{$_}\t";
        # value をコードポイントに変換して格納
        my @codes = map { 
                          push @strings, (sprintf "%04x", unpack("U", $_));
                          #デバッグ
                          #print "*$_*";
                          # コードポイント変換
                          sprintf "%04x", unpack("U", $_)
                          # 分解された value に対する split
                        } split //, $nf->{$_};
        # コードポイントを出力
        print "\n       : ";
        print join('', @codes), "\n";
        print "strings: ", reorder(join '', @strings), "\n";
        print "reorder: ", reorder(join '', @strings), "\n";
        my @cmp = map{ compose($_) } @strings;
        print "compose: ";
        map { print $_ } @cmp;
        print "\n";
        print "\n";
        # デリファレンスしたハッシュの key をソート
      } sort (keys %$nf);
      print "\n";
}

#my @str = qw(é é);
#my @str = qw(fi ﬁ);
#my @str = qw();
#my @str = qw(ä é fi ä ﬁ ä é);
my $str = "ǼǺ";
#my $str = "\x{0041}\x{02DA}\x{00B8}\x{00C5}";
#my $str = "é é";
#my $str = "ä é fi ä ﬁ ä é";
print "str : $str\n";
#print "str        : @str\n";
print "\n";

my $NFD_str = NFD($str);
print "str : $NFD_str\n";

my @code = map { sprintf "%04x", unpack("U", $_) } split //,$NFD_str;
print "@code\n";

map {  my($processed, $unprocessed) = splitOnLastStarter($_);
       print "$processed, $unprocessed\n"; } @code;
#output( $str );
#map { output( $_ ) } @str;



