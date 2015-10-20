#!/usr/bin/perl

use strict;
use warnings;

# eval で動的に実行されるコードを変更する
# http://gihyo.jp/dev/serial/01/perl-hackers-hub/000702
my $code;
foreach my $name ('foo', 'bar') {
  $code .= qq/sub $name { print "this is $name\n" }/;
}

eval $code; # foo and bar
foo(); # this is foo
bar(); # this is bar

