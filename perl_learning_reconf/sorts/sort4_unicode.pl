#!/usr/bin/perl

use strict;
use warnings;
use utf8;

# http://d.hatena.ne.jp/punitan/20091120/1258680792

use Unicode::Normalize qw/NFKC NFKD NFC NFD/;
binmode STDOUT, ":utf8";

print "$Unicode::Normalize::VERSION\n";

my $src = "あアｱ　がガｶﾞ　ぱパﾊﾟ　むムﾑﾞ　abcａｂｃ　123１２３　①②Ⅲⅳ";

print "$src\n";
print "NFKC: ", NFKC($src), "\n";
#repr(NFKC($src)); print "\n";
print "NFKD: ", NFKD($src), "\n";
#repr(NFKD($src)); print "\n";
print "NFC: ", NFC($src), "\n";
#repr(NFC($src)); print "\n";
print "NFD: ", NFD($src), "\n";
#repr(NFD($src)); print "\n";

sub repr {
  my $str = shift;
  for(0..length($str)-1) {
    printf("\\u%04X", unpack("U", substr($str, $_, 1)) );
  }
}
