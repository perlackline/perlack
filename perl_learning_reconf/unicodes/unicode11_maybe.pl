#!/usr/bin/perl

use strict;
use warnings;

use utf8;
#use Unicode::Normalize;
use Unicode::Normalize qw(splitOnLastStarter compose reorder NFD NFC NFKD NFKC FCD FCC);
use charnames qw(:full);

binmode STDOUT, ':utf8';

my $A_acute_accent =  "A\N{COMBINING ACUTE ACCENT}";
my $B_acute_accent =  "B\N{COMBINING ACUTE ACCENT}";
my $A_nfc = "\N{LATIN CAPITAL LETTER A WITH ACUTE}";
print "A    : $A_acute_accent\n";
print "B    : $B_acute_accent\n";
print "Anfc : $A_nfc\n";
#my @str = qw(é é);
#my @str = qw(fi ﬁ);
#my @str = qw();
#my @str = qw(ä é fi ä ﬁ ä é);
my $str = "ǼǺ";
#my $str = "\x{0041}\x{02DA}\x{00B8}\x{00C5}";
#my $str = "é é";
#my $str = "ä é fi ä ﬁ ä é";



