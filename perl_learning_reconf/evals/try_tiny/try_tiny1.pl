#!/usr/bin/perl

use strict;
use warnings;

use Try::Tiny;

$_ = "default \$_";
$@ = "default \$\@";

my $result_1 = try { 4/2 } catch { "catch!!" };
my $result_2 = try { 4/0 } catch { "catch!!" };
my $result_3 = try { die } catch { "catch!!" };
#my $result_4 = eval { die } || "catch!!";
#my $result_4 = eval { 0 } || "catch!!";
my $result_4 = (eval { die } or "catch!!");

print "$result_1\n";
print "$result_2\n";
print "$result_3\n";
print "$result_4\n";

