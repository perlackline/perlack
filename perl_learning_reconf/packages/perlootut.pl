#!/usr/bin/perl

use strict;
use warnings;

# http://perldoc.jp/docs/perl/5.22.1/perlootut.pod
# http://blog.livedoor.jp/dankogai/archives/50816007.html

package File;

sub new { 
  my $class = shift;
  bless { @_ }, $class; 
}

# path のアクセサ
sub path {
  my $self = shift;
  $self->{paht} = shift if @_;
  return $self->{path};
}

# path を print
sub print_info {
  my $self = shift;

  # 引数チェック
  my $prefix = @_ ? shift : '';

  print $prefix, $self->path, "\n";
}

package main;

my $file= File->new(
    path => '/etc/hostname',
    content => "foo\n",
    last_mod_time => 1304974868,
);

#use Data::Dumper;
#print Dumper $file;

#$file->print_info("The file is located at ");
$file->print_info;

print $file->path, "\n";

