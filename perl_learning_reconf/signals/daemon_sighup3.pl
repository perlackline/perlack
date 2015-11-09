#!/usr/bin/perl

use strict;
use warnings;

# 再起動が 1 回しかできない問題の解決方法。
# Using SIGHUP to restart a daemon
# http://www.perlmonks.org/?node_id=1058565
# 再起動ルーチンをハンドラの外に出すことで
# 2 回め以降のシグナルでも再起動を可能にするコード。

# モジュール POSIX のルーチンを利用した例。
# http://www.perlmonks.org/?node_id=440900

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
my $sigset = POSIX::SigSet->new();
my $action = POSIX::SigAction->new(
                  'sigHUP_handler',
                  $sigset,
                  &POSIX::SA_NODEFER);
POSIX::sigaction(&POSIX::SIGHUP,$action);

sub sigHUP_handler {
  print "\ngot SIGHUP\n";
  exec($SELF) or die "couldn't restart: $!\n";
};

code();

sub code {
  print "PID: $$\n";
  print "ARGV: @ARGV\n";
  my $count = 0;
  while (++$count) {
    sleep 2;
    print "$$ - $count\n";
  }
}


