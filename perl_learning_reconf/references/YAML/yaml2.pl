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

# Dump the Perl data structures back into YAML.
print Dump($string,$arrayref,$hashref);

print "------\n";
print "------\n";
# YAML::Dump is used the same way you'd use Data::Dumper::Dumper
use Data::Dumper;
print Dumper($string,$arrayref,$hashref);

