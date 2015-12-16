#!/usr/bin/perl

use strict;
use warnings;

use utf8;
use Unicode::Normalize qw( decompose NFD reorder );
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

my @str = qw(ä é fi ä ﬁ ä é);
print "str        : @str\n";

my @sorted = sort @str;
print "sorted     : @sorted\n";

my @nfd = map { NFD( $_ ) } @str;
my @srt_nfd = sort @nfd;
print "sorted NFD : @srt_nfd\n";

my $string = "ä é fi ä ﬁ ä é";
my $NFD_string = reorder(decompose($string));
print "$NFD_string\n";
