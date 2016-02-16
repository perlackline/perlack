#!/usr/bin/perl

use strict;
use warnings;

my @args = qw(1 2 3);

# 配列全体のリファレンス
my $ary_ref = \@args;
print "ary_ref: $ary_ref\n";

# 要素 0 のリファレンス
my $elm_ref = \$args[0];
print "elm_ref: $elm_ref\n";

check_arg(@args);

print "@args\n";

sub check_arg {

  # 配列全体のリファレンス
  my $at_ref = \@_;
  print "at_ref : $at_ref\n";

  # 要素 0 のリファレンス
  my $at_eml = \$_[0];
  print "at_eml : $at_eml\n";

  push @_, 'a';

  print "@_\n";

}

