#!/usr/bin/perl

#use strict;
#use warnings;

# http://www.chikkun.com/und/document/perl/inside_out.html
# 変数のスコープからインサイドアウトクラスまで

# パッケージ (ファイル) のスコープ
package Hoge2;

our $default = "sakai";

sub new {
  my $class = shift;
  my $self = { default => 1 };
  return bless $self, $class;
}

sub printDefault {
  my $this = shift;
  print $this->{default}, " at Hoge2//\n";
}

package Geho;

our $def = "chikkun";

