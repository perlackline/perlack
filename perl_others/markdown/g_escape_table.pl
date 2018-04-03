#!/usr/bin/perl
use strict;
use warnings;

use Digest::MD5 qw(md5_hex);

my %g_escape_table;
foreach my $char (split //, '\\`*_{}[]()>#+-.!') {
  print "\$char: $char\n";
  $g_escape_table{$char} = md5_hex($char);
}

foreach my $hex (keys %g_escape_table){
  print "$hex: $g_escape_table{$hex}\n";
}

__END__
# output
$char: \
$char: `
$char: *
$char: _
$char: {
$char: }
$char: [
$char: ]
$char: (
$char: )
$char: >
$char: #
$char: +
$char: -
$char: .
$char: !
_: b14a7b8059d9c055954c92674ce60032
{: f95b70fdc3088560732a5ac135644506
\: 28d397e87306b8631f3ed80d858d35f0
!: 9033e0e305f247c0c3c80d0c7848c8b3
]: 0fbd1776e1ad22c59a7080d35c7fd4db
}: cbb184dd8e05c9709e5dcaedaa0495cf
[: 815417267f76f6f460a4a61f9db75fdb
): 9371d7a2e3ae86a00aab4771e39d255d
(: 84c40473414caf2ed4a7b1283e48bbf4
#: 01abfc750a0c942167651c40d088531d
.: 5058f1af8388633f609cadb75a75dc9d
`: 833344d5e1432da82ef02e1301477ce8
-: 336d5ebc5436534e61d16e63ddfca327
*: 3389dae361af79b04c9c8e7057f60cc6
>: cedf8da05466bb54708268b3c694a78f
+: 26b17225b626fb9238849fd60eabdf60

