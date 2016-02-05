#!/usr/bin/perl

use strict;
use warnings;

use I18N::Langinfo qw(langinfo CODESET);
use Encode;

my $codeset = langinfo(CODESET);

print "CODESET: $codeset\n";

@ARGV = map { decode($codeset, $_) }@ARGV;

my @args = map { encode($codeset, $_) }@ARGV;

print "$_\n" for @args;
