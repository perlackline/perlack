#!/usr/bin/perl

use strict;
use warnings;

my $str1 = 'Perl user';
my $str2 = 'User perl';
my $str3 = 'Ruby user';
my $str4 = "I'm using perl ruby python php";

perl_checker($str1,$str2,$str3,$str4);

sub perl_checker {
  foreach my $str (@_){

    # 引数の文字列の Perl|perl にマッチング
    if ($str =~ /[pP]erl/){
      print "Perl Monger! : ";
      print "[$str]\n";
    }
  }
}


