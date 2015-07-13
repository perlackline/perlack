
sub feed_a_cow_named {
  my $name = shift;
  my $con = Cow->named($name);
  $cow->eat('grass');
  print "Returning from the subroutine.\n"; # $cow はここで破棄される
}
print "Start of program.\n";
my $outer_cow = Cow->named('Bessie');
print "Now have a cow named ", $outer_cow->name, ".\n";
feed_a_cow_named('Grew');
print "Returnd from subroutine.\n";
