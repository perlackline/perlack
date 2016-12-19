#!/usr/bin/perl

use strict;
use warnings;

package Post;
sub render {
  my $class = shift;
  my ($title,@body) = @_;
  my $self = bless { title => $title, body => [ @body ] }, $class;
  my $html = <<END;
<article>
  <h1>$self->{title}</h1>
  <p>@{$self->{body}}</p>
</article>
END
  return $html;
}

package main;

print Post->render('title','Hello world.'), "\n";

