#!/usr/bin/perl

use strict;
use warnings;

# Class method only

package Post;
sub render {
  my $class = shift;
  my ($title,@body) = @_;
  my %hash = ( title => $title, body => [ @body ] );
  #my $self = bless { title => $title, body => [ @body ] }, $class;
  my $html = <<END;
<article>
  <h1>$hash{title}</h1>
  <p>@{$hash{body}}</p>
</article>
END
  return $html;
}

sub find {
  my $class = shift;
  my $file = shift;
  open my $fh, "<", $file or die "Could't open $file: $!";
  my ($title, @body) = <$fh>;
  close $fh;
  chomp $title;
  #{ title => $title, body => [ @body ] };
  Post->render($title,@body);
}

package main;

#print Post->render('title','Hello world.'), "\n";
#my $hash_ref = Post->find('html.txt');
#print Post->render($hash_ref->{title}, @{$hash_ref->{body}} ), "\n";
print Post->find('html.txt'). "\n";
