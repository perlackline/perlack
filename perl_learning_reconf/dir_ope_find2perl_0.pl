#! /home/ohira/perl5/perlbrew/perls/perl-5.16.3/bin/perl -w
    eval 'exec /home/ohira/perl5/perlbrew/perls/perl-5.16.3/bin/perl -S $0 ${1+"$@"}'
        if 0; #$running_under_some_shell

use strict;
use File::Find ();

# Set the variable $File::Find::dont_use_nlink if you're using AFS,
# since AFS cheats.

# for the convenience of &wanted calls, including -eval statements:
use vars qw/*name *dir *prune/;
*name   = *File::Find::name;
*dir    = *File::Find::dir;
*prune  = *File::Find::prune;

sub wanted;



# Traverse desired filesystems
File::Find::find({wanted => \&wanted}, '.');
exit;


sub wanted {
    /^.*\.pl\z/s
    && print("$name\n");
}

