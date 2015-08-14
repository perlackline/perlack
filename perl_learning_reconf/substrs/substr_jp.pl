#!/usr/bin/perl

use strict;
use warnings;

use utf8;
use Encode;

# 入力受付
print "string: ";
chomp(my $string = <STDIN>);
print "substring: ";
chomp(my $substr = <STDIN>);
print "replace: ";
chomp(my $replace = <STDIN>);

# UTF-8 を flagged utf8 にデコード
my $dec_string  = decode('utf-8', $string);
my $dec_substr  = decode('utf-8', $substr);
my $dec_replace = decode('utf-8', $replace);

# flagge utf8 の文字列から長さを取得
my $length = length($dec_substr);

# 文字列はすべて flagged utf8
substr($dec_string, index($dec_string, $dec_substr ), $length, $dec_replace);

substr($dec_string, index($dec_string, $dec_substr ))
    =~ s/$dec_substr/$dec_replace/g;

# 出力前に UTF-8 にエンコード
my $enc_string = encode('utf-8', $dec_string);

print "$enc_string\n";

#my $string = 'I know you can do it.';
##my $substr = substr($string, index($string, 'can'), 3, "can't");
#substr($string, index($string, 'can'), 3) = "can't";
#
##print "$substr\n";
#print "$string\n";

#my $string = "my note, my pen, my book and my desk.";
#
#substr($string, 17) =~ s/my/your/;
#
#print "$string\n";

