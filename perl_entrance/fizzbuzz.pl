#!/usr/bin/env perl

use strict;
use warnings;

# http://nkmrgk.tumblr.com/post/11519064220/fizzbuzz%E3%82%92%E6%9B%B8%E3%81%84%E3%81%9F%E3%81%93%E3%81%A8%E3%81%8C%E3%81%AA%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7perl%E3%81%A7%E5%AE%9F%E8%A3%85%E3%81%97%E3%81%A6%E3%81%BF%E3%81%9F%E4%BB%95%E6%A7%98%E3%81%AF%E3%81%93%E3%82%8C

# ------------------
#sub fizzbuzz {
#  my ($n, $rv) = @_;
#  $rv = 'Fizz' unless ($n % 3);
#  $rv .= 'Buzz' unless ($n % 5);
#  $rv ? $rv : $n;
#}
#
##print (fizzbuzz($_), "\n") for (1..$ARGV[0] || 15);
#print fizzbuzz($_), "\n" for (1..$ARGV[0] || 15);
# ------------------

# ------------------
#my $data = {
#  3 => 'Fizz',
#  5 => 'Buzz',
#};
#
#sub fizzbuzz {
#  my ($n, $rv) = @_;
#  foreach my $k (sort keys %{$data}) {
#    $rv .= $data->{$k} unless ($n % $k);
#  }
#  $rv ? $rv : $n;
#}
#
#print fizzbuzz($_), "\n" for ( 1..$ARGV[0] || 50);
# ------------------

# ------------------
my $data = [
  {
    'expr' => '$n % 3 == 0',
    'data' => 'Fizz',
  },
  {
    'expr' => '$n % 5 == 0',
    'data' => 'Buzz',
  },
];

sub fizzbuzz {
  #my ($n, $rv) = @_;
  my $n = shift;
  my $rv;
  foreach (@{$data}) {
    $rv .= $_->{data} if (eval $_->{expr});
  }
  $rv ? $rv : $n;
}

print fizzbuzz($_), "\n" for ( 1..$ARGV[0] || 50);

