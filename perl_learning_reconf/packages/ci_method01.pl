#!/usr/bin/perl

use strict;
use warnings;

package Post;
sub new {
  my $class = shift;
  my ($title,$keyword,$description,$category,@body) = @_;
  chomp ( $title, $keyword, $description, $category );
  bless { 
    title       => $title,
    keyword     => $keyword,
    description => $description,
    category    => $category,
    body        => [ @body ],
  }, $class;
}

sub render {
  my $self = shift;
  my $html = <<END;
<article>
  <h1>$self->{title}</h1>
  <p>$self->{keyword} $self->{description} $self->{category}</p>
  <p>@{$self->{body}}</p>
</article>
END
  return $html;
}

sub find {
  my $class = shift;
  my $file = shift;
  open my $fh, "<", $file or die "Could't open $file: $!";
  #my ($title,$keyword,$description,$category, @body) = <$fh>;
  my @contents = <$fh>;
  close $fh;
  #$class->new($title,$keyword,$description,$category, @body);
  $class->new( @contents );
}

package main;

#my $post = Post->new('title','Hello world.');
my $post = Post->find('html.txt');
print $post->render. "\n";

