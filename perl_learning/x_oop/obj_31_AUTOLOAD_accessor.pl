#!/usr/bin/perl

use strict;
use warnings;

# P189
# AUTOLOAD を利用したアクセッサ
# Change AUTOLOAD


{ package Animal;

  use Carp;

  # Change AUTOLOAD
  # named, name, color, eat, speak, age, weight, height
  sub AUTOLOAD {
  our $AUTOLOAD;
    my @elements = qw(color eat speak age weight height);
    # パッケージ名を取り除く
    if ($AUTOLOAD =~ /::(\w+)$/ and grep $1 eq $_, @elements) {
      my $field = ucfirst $1;
      {
        no strict 'refs';
        *{$AUTOLOAD} = sub { $_[0]->{$field} = $_[1] };
      }
      goto &{$AUTOLOAD};
    }
 
    if ($AUTOLOAD =~ /::set_(\w+)$/ and grep $1 eq $_, @elements) {
      my $field = ucfirst $1;
      {
        no strict 'refs';
        *{$AUTOLOAD} = sub { $_[0]->{$field} = $_[1] };
      }
      goto &{$AUTOLOAD};
    }

    Carp::croak "$_[0] does not understand method\n";
  }
}
# =====================================--
# named, name, color, eat, speak, age, weight, height

use Data::Dumper;

print "\n---\n";
my $color = Animal->set_color('blue');
print "$color\n";
print Animal->color, "\n";;
print "---\n\n";

print "End of program.\n";

