#!/usr/bin/perl

use strict;
use warnings;

# 再起動が 1 回しかできない。
# 原因はハンドラの中で exec が書かれていることで
# 2 回め以降のシグナルがブロックされるためらしい。

use POSIX ();
use FindBin ();
use File::Basename ();
use File::Spec::Functions;

$| = 1;

# make the daemon cross-platform, so exec always calls the script
# itself with the right path, no matter how the script was invoked.
my $script = File::Basename::basename($0);
my $SELF   = catfile($FindBin::Bin, $script);

# POSIX unmasks the sigprocmask properly
$SIG{HUP} = sub {
  print "\ngot SIGHUP\n";
  exec($SELF, @ARGV) || die "$0: couldn't restart: $!";
};

code();

sub code {
  print "PID: $$\n";
  print "ARGV: @ARGV\n";
  my $count = 0;
  while (++$count) {
    sleep 2;
    print "$count\n";
  }
}


