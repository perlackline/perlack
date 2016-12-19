#!/usr/bin/perl

use strict;
use warnings;

package Post;
sub new {
  my $class = shift;
  my ($title,@body) = @_;
  chomp $title;
  bless { title => $title, body => [ @body ] }, $class;
}

sub render {
  my $self = shift;
  my $html = <<END;
<article>
  <h1>$self->{title}</h1>
  <p>@{$self->{body}}</p>
</article>
END
  return $html;
}

#sub find {
#  my $class = shift;
#  my $file = shift;
#  open my $fh, "<", $file or die "Could't open $file: $!";
#  my ($title, @body) = <$fh>;
#  $class->new($title, @body);
#}

package main;

my $post = Post->new('title','Hello world.');
#my $post = Post->find('html.txt');
print $post->render. "\n";

