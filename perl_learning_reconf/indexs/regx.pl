#!/usr/bin/perl

use strict;
use warnings;

# プログラムコード内の文字列リテラルを
# すべて flagged utf8 として扱う
#use utf8;
use Encode;

print "please enter string: ";
chomp(my $str = <STDIN>);

# flagged utf8
#my $dec_str = decode('utf-8', $str);
my $dec_str = $str;

#my $patn = decode('utf-8', 'ワールド');
if ($dec_str =~ /ワールド/) {
#if ($dec_str =~ /$patn/ ) {
  #print "much!\n";
  #print encode('utf-8',"'$dec_str' には [ワールド] が含まれます。"),"\n";
  print "'$dec_str' には [ワールド] が含まれます。\n";
} else {
  #print "unmuch!\n";
  #print encode('utf-8',"'$dec_str' には [ワールド] が含まれません。"),"\n";
  print "'$dec_str' には [ワールド] が含まれません。\n";
}

