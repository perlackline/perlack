#!/usr/bin/perl

use strict;
use warnings;

use YAML;
#use YAML::XS;

# Load a YAML stream of 3 YAML documents into Perl data structures.
# YAML ストリームをロードする 3 つの YAML ドキュメントの Perl のデータ構造向けの

# ヒアドキュメント スタート
my($hashref,$arrayref,$string) = Load(<<'...');
---
# hash ref
name: ingy
age: old
weight: heavy
# I should comment that I also like pink, but don't tell anybody.
favorite colors:
 - red
 - green
 - blue
---
# array ref
- Clark Evans
- Oren Ben-Kiki
- Ingy döt Net
--- >
# scalar
You probably think YAML stands for "Yet Another Markup Language". It ain't! YAML is really a data serialization language. But if you want to think of it as a markup, that's OK with me. A lot of people try to use XML as a serialization format.

"YAML" is catchy and fun to say. Try it. "YAML, YAML, YAML!!!"
...
# ヒアドキュメント エンド

print "--- scalar ---\n";
#print "$string\n";
my $part = "YAML";
my $position = 0; 
my $where = 0;
my $cnt = 0;

while ( $where >= 0 ){
  $where = index($string, $part, $position);
  next if $where < 0;
  $position = $where + 1;
  $cnt++;
}

print "number of word 'YAML': $cnt\n";

print "--- array ref ---\n";
print map{ "$_\n" } @{$arrayref};
print "\n";

print "--- hash ref ---\n";
foreach my $key ( keys %{$hashref} ){
  if ($key =~ /favorite colors/){
    print "$key:\n", map{" $_\n"} @{$hashref->{$key}};
  }else{
    print "$key: $hashref->{$key}\n";
  }
}

