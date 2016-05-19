#!/usr/bin/perl

use strict;
use warnings;

# http://www.chikkun.com/und/document/perl/inside_out.html
# 変数のスコープからインサイドアウトクラスまで

# パッケージ (ファイル) のスコープ
package Hoge;

my $default = "sakai";

sub new {
  my $class = shift;
  my $self = { default => 1 };
  return bless $self, $class;
}

sub printDefault {
  my $this = shift;
  print $this->{default}, "\n";
}

package Geho;

my $def = "chikkun";

package main;

print "---Hoge.pm の main START---\n"; 
my $instance = Hoge->new();
$instance->printDefault(); # 1

$instance->{default} = 100;
$instance->printDefault(); # 100

print $default, "\n"; # sakai
print $def, "\n";     # chikkun
# add
print "---Hoge.pm の main END---\n"; 

__END__
# output
1
100
sakai
chikkun

