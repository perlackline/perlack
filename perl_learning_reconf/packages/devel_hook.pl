use Devel::Hook ();

INIT {
  print "INIT #2\n";
  }

BEGIN {
  Devel::Hook->push_INIT_hook( sub { print "INIT #3 (hook)\n" } );
  Devel::Hook->unshift_INIT_hook( sub { print "INIT #1 (hook)\n" } );
  }

print "RUNTIME\n";

