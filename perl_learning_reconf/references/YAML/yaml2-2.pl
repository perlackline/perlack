#!/usr/bin/perl

use strict;
use warnings;

use YAML;

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

print "--- scalar ---\n$string\n";

print "--- array ref ---\n";
print map{ "$_\n" } @{$arrayref};
print "\n";
print "--- hash ref ---\n";
#print map{ "$_ : $hashref->{$_}\n" } keys %{$hashref};

foreach my $key ( keys %{$hashref} ){
    $key =~ /favorite colors/ ? print "$key\n", map {" : $_\n"} @{$$hashref{$key}} : print "$key : $$hashref{$key}\n";
                        
}




