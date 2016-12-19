#!/usr/bin/perl

use strict;
use warnings;

# Class method only

package Post;
sub render {
  my $class = shift;
  my ($title, $keyword, $description, $category, @body) = @_;
  chomp ($title, $keyword, $description, $category);
  my %hash = (
    title => $title,
    keyword => $keyword,
    description => $description,
    category => $category,
    body => [ @body ],
  );
  my $html = <<END;
<article>
  <h1>$hash{title}</h1>
  <p>$hash{keyword} $hash{description} $hash{category}</p>
  <p>@{$hash{body}}</p>
</article>
END
  return $html;
}

sub find {
  my $class = shift;
  my $file = shift;
  open my $fh, "<", $file or die "Could't open $file: $!";
  my @contents = <$fh>;
  close $fh;
  Post->render(@contents);
}

package main;

print Post->find('html.txt'). "\n";
