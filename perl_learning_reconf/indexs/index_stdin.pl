#!/usr/bin/perl

# Perl: 文字コードとutf8フラグについて
# http://bayashi.net/wiki/perl/unicode

use strict;
use warnings;

# プログラムコード内の文字列リテラルを
# すべて flagged utf8 として扱う
use utf8;

# デコード/エンコード のためのモジュール
use Encode;

my $string;
my $substr;
my $dec_string;
my $dec_substr;

# (1) 外部から文字列を受け付ける
until( $string && $substr ) {

  unless ($string) {
    print "Please enter any string: ";
    chomp($string = <STDIN>);
    $dec_string = decode('utf-8', $string)
      if ($string);
    print encode ('utf-8', "$dec_substr を検索する文字列を入力"), "\n "
      if ($dec_substr);
  }
  unless ($substr) {
    print "substring ";
    chomp($substr = <STDIN>);
    $dec_substr = decode('utf-8', $substr)
      if ($substr); 
    print encode ('utf-8', "$dec_string に対する部分文字列を入力"), "\n: "
      if ($dec_string);
  }
}

#use Devel::Peek;

#print "**Default *** \$string & \$substr: "; 
#Dump ($string);
#Dump ($substr);
#print "\n";

# (2) 外部からの文字列を処理する前に
#     flagged utf8 に変換 (デコード)


#print "*** Decode *** \$dec_string & \$dec_substr: "; 
#Dump ($dec_string);
#Dump ($dec_substr);
#print "\n";

# (3) flagged utf8 にデコードした文字列を処理
my $where = index($dec_string, $dec_substr);

# (4) 出力する前に flagged utf8 の文字列を
#     UTF-8 に変換 (エンコード)
my $enc_substr = encode('utf-8', $dec_substr);

#print "*** Encode *** \$enc_substr: "; 
#Dump ($enc_substr);
#print "\n\n";

# (5) UTF-8 に変換した文字列を出力
print "$enc_substr position: $where\n\n";

