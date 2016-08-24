#!/usr/bin/perl

use strict;
use warnings;

use IO::Tee;

my $string = '';

open my $read_fh, '<', 'text.in' or die "$!";
open my $log_fh, '>', 'text.out' or die "$!";
open my $scalar_fh, '>', \$string;

my $tee_fh = IO::Tee->new( $read_fh, $log_fh, $scalar_fh );

# 読み込みしつつ書き込み
my @message = <$tee_fh>;

#my $message = "HoHoHo!\n";

# 読み込みしつつ書き込み
#print $tee_fh $message;

print "scalar---\n$string\n";

