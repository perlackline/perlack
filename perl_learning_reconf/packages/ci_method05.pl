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

# アクセサを追加
sub elements {
  my $self    = shift;
  my $elm_key = shift or die "please set one or two args: $!";
  my $elm_val = shift;

  if ( $elm_key eq 'body' ){
    @{ $self->{$elm_key} } = $elm_val if $elm_val;  
    join '', @{ $self->{$elm_key} };
  }else{
    $self->{$elm_key} = $elm_val if $elm_val;
    $self->{$elm_key};
  }
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
  my @contents = <$fh>;
  close $fh;
  $class->new( @contents );
}

package main;

my $post = Post->find('html.txt');
print $post->render. "\n";
print "---\n";

#print $post->elements. "\n";
print "---\n";
print $post->elements('title'). "\n";
print "---\n";
print $post->elements('title','new title'). "\n";
print "---\n";
print $post->elements('body'), "\n";
print "---\n";
print $post->elements('body', 'Eeny, meeny, miny, moe'). "\n";
print "---\n";


