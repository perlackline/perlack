#!/usr/bin/perl

use strict;
use warnings;

# 全体を無名ハッシュリファレンスとして構築
my $greets = {
  Bellri => sub {
    my $person = shift;
    print "Bellri: Hey there, $person!\n";
  },
  Aida => sub {
    my $person = shift;
    if ($person eq "Bellri") {
      print "Aida: $person !?, Rayhumton ... ?\n";
    } else {
      print "Aida: Hi, $person!\n";
    }
  },
  Raraiya => sub {
    my $person = shift;
    print "Raraiya: $person? ... Chuchumy!\n";
  },
};

my @room = ();
foreach my $person ( qw(Bellri Aida Raraiya) ){
  print "->> $person walks into the room.\n";

  print "[Who is in the room?] ", join ',',@room, "\n";
  foreach my $room_person ( @room ){

    # $greets をデリファレンスして利用
    ${$greets}{$person}->($room_person);
    ${$greets}{$room_person}->($person);
    #$greets->{$person}->($room_person);
    #$greets->{$room_person}->($person);
  }
  print "\n";
  push @room, $person;
}

print scalar @room, " persons in the room.\n";

