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

my @str = qw(ä é ä ﬁ ä é);
print "str        : @str\n";

my @sorted = sort @str;
print "sorted     : @sorted\n";

my @nfkd = map { NFKD( $_ ) } @str;
print "nfkd       : @nfkd\n";
my @srt_nfkd = sort @nfkd;
print "sorted nfkd: @srt_nfkd\n";

my $composed   = "\x{00E9}"; 
my $decomposed = "\x{0065}\x{0301}";
print "composed   : $composed\n";
print "decomposed : $decomposed\n";

my @str2 = ($composed, $decomposed, qw(b d c f a));
print "str : @str2\n";
my @sorted2 = sort @str2;
print "sorted     : @sorted2\n";


my $ord_cmp   = ord($composed);
my ($ord_decmp, $ord_decmp2) = ord($decomposed);

printf "cmp   : %x\n", $ord_cmp;
printf "decmp : %x %x\n", $ord_decmp, $ord_decmp2;

