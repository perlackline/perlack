#!/usr/bin/perl

use strict;
use warnings;

my %greets = (
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
);

my @room = ();
foreach my $person ( qw(Bellri Aida Raraiya) ){
  print "->> $person walks into the room.\n";

  print "[Who is in the room?] ", join ',',@room, "\n";
  # room に人が居なければなにも処理しない
  foreach my $room_person ( @room ){
    $greets{$person}->($room_person);
    $greets{$room_person}->($person);
  }
  print "\n";
  push @room, $person;
}

print scalar @room, " persons in the room.\n";

