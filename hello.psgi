use strict;
package Hello;
use parent 'Tatsumaki::Handler';

sub get {
  my $self = shift;
  $self->write("Hello World");
}

use Tatsumaki::Application;
my $app = Tatsumaki::Application->new([
  '/hello' => 'Hello',
]);

$app->psgi_app;

