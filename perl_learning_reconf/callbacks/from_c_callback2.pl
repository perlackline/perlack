#!/usr/bin/perl

use strict;
use warnings;

# from C

my $Mymsg = {
      appId => 1,
      msgbody => '',
};

sub myfunc {
  my $msg = shift;
  if ($msg->{msgbody}){
    printf "App Id = %d \nMsg = %s \n", $msg->{appId}, $msg->{msgbody};
  } else {
    printf "App Id = %d \nMsg = No Msg \n", $msg->{appId};
  }
}

my $msg1 = $Mymsg;
$msg1->{appId} = 100;
#$msg1->{msgbody} = "This is a test\n";

my $callback = \&myfunc;

$callback->($msg1);

