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


binmode STDOUT, ':utf8';

print "ä\n";
my $code = ord 'ä';
print "$code\n";
print "\N{U+263A}\n";
print "\N{U+0158}\n";
print "\x{E9}\n";
print "\x{65}\x{301}\n";

print "---\n";
my $alefbet = pack( 'U*', 0x05d0..0x05ea );
print "alefbet: $alefbet\n";
my $utf = "ä";
#my @hebrew = unpack( 'U*', $uft );
my @hebrew = unpack( 'U', $utf );
print "hebrew : @hebrew\n";

print "---\n";
print $Config{installprivlib}, "\n";

é é


