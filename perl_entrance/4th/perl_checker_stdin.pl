#!/usr/bin/perl

use strict;
use warnings;

print "--> Start program ...\n";
print "Please enter a any string.\n";
print "<-- Enter 'exit' to exit program.\n";

while (<STDIN>){
  chomp;
  if (/exit/) { last }
  perl_checker($_);
}

print "<<- Exit the program.\n";

sub perl_checker {
  my $str = shift;
  # 引数の文字列の Perl|perl にマッチング
  print "---\n";
  if ($str =~ /[pP]erl/){
    print "Match!! Perl Monger! : [$str]\n";
  }else{
    print "Not match ... : [$str]\n";
  }
  print "---\n";
}


