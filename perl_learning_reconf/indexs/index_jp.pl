#!/usr/bin/perl

# Perl: 文字コードとutf8フラグについて
# http://bayashi.net/wiki/perl/unicode

use strict;
use warnings;

use utf8;
use Encode;

my $string = 'ハローワールド。ハローパール。';
my $substr = 'ワールド'; 

#my $string = decode('utf-8', 'ハローワールド。ハローパール。');
#my $substr = decode('utf-8', 'ワールド'); 

my $where = index($string, $substr);

print encode('utf-8',$substr), "position: $where\n";


#my $jp = decode('utf-8', "ハローワールド, ハローパール。");
#my $word = decode('utf-8',"ワールド");
#my $where_jp = index ($jp, $word);
#print "position: $where_jp, ", encode('utf-8', $word), "\n";
#my $r_where_jp = rindex ($jp, $word);
#print "r_position: $r_where_jp in ", encode('utf8', $word), "\n";


