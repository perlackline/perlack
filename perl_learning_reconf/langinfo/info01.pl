#!/usr/bin/perl

use strict;
use warnings;

use I18N::Langinfo qw(langinfo ABDAY_1 YESSTR NOSTR);

my($abday_1, $yesstr, $nostr) = map{langinfo($_)} (ABDAY_1,YESSTR,NOSTR);
#my $abday_1 = langinfo(ABDAY_1);
#my $yesstr  = langinfo(YESSTR);
#my $nostr   = langinfo(NOSTR);

print "$abday_1? [$yesstr/$nostr]\n";

