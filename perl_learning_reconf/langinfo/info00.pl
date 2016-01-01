#!/usr/bin/perl

use strict;
use warnings;

use I18N::Langinfo qw(langinfo CODESET);
my $codeset = langinfo(CODESET);
print "$codeset\n";
