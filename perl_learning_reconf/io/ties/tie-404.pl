#!/usr/bin/perl

use strict;
use warnings;

# http://blog.livedoor.jp/dankogai/archives/51076010.html
# tie() とは
# オブジェクトではない Perl の組み込みデータタイプを
# 裏でオブジェクト化する仕組み
{
  package MyScalar;
  use Carp;
  sub TIESCALAR {
    my $pkg = shift;
    carp "TIESCALAR('$pkg')";
    bless \do { my $scalar }, $pkg;
  }
  sub FETCH($) {
    my $this = shift;
    carp "FETCH($this)";
    return $$this;
  }
  sub STORE($$) {
    my ( $this, $value ) = @_;
    carp "STORE($this, $value)";
    $$this = $value;
  }
  sub DESTROY {
    my $this = shift;
    carp "DESTROY($this)";
  }
}

# main ?
{
  # クラス MyScalar を $sclara に結びつける
  tie my $scalar, 'MyScalar';
  $scalar = 1;
  print $scalar, "\n";

  print "---\n";
  $scalar++;
  print $scalar, "\n";

  print "---\n";
  print 'tied($scalar) = ', tied($scalar), "\n";

  print "---\n";
  tied($scalar)->STORE(3);
  print $scalar, "\n";
}

