#!/usr/bin/perl

use strict;
use warnings;

my %TV = (
 
  # ハッシュ
  flintstones => {
    # スカラ
    series  => "flintstones",
    # 配列
    nights  => [ qw(monday thursday friday) ],
    # ハッシュの配列
    members => [
      { name => "fred",    role => "lead", age => 36, },
      { name => "wilma",   role => "wife", age => 31, },
      { name => "pebbles", role => "kid",  age => 4, },
      { name => "anon boy",  role => "son",  age => 99, },
    ],
  },
  jetsons => {
    series  => "jetsons",
    nights  => [ qw(wednesday saturday) ],
    members => [
      { name => "george", role => "lead", age => 41, },
      { name => "jane",   role => "wife", age => 39, },
      { name => "elroy",  role => "kid",  age => 9, },
      { name => "anon girl",  role => "daughter",  age => 99, },
    ],
  },
  simpsons => {
    series  => "simpsons",
    nights  => [ qw(monday) ],
    members => [
      { name => "homer", role => "lead", age => 34, },
      { name => "marge", role => "wife", age => 37, },
      { name => "bart",  role => "kid",  age => 11, },
      { name => "anon girl",  role => "daughter",  age => 99, },
    ],
  },
);

use Storable qw/store_fd nstore_fd fd_retrieve/;
#store \%TV, 'hash_file';

use Benchmark qw(cmpthese);
#use DateTimeX::Factory;
#use Time::Moment;
#
#my $dt = DateTimeX::Factory->new(time_zone => 'Asia/Tokyo');

# ** store_fd vs nstore_fd **
# = nstore_fd がやや遅いが誤差の範囲.

my $store = sub{
    open my $fd, '>', 'hash_file' or die "$!";
    store_fd \%TV, $fd;
    close $fd;
    open my $read_fd, '<', 'hash_file' or die "$!";
    my $read = fd_retrieve $read_fd;
};
my $nstore = sub{
    open my $fd_n, '>', 'hash_file2' or die "$!";
    nstore_fd \%TV, $fd_n;
    close $fd_n;
    open my $read_fd_n, '<', 'hash_file2' or die "$!";
    my $read_n = fd_retrieve $read_fd_n;
};
#my $count = -10;
cmpthese 50_000,{
  'store_fd'  => $store,
  'nstore_fd' => $nstore,
};


