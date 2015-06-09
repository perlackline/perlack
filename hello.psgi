use strict;
package Hello;
use parent 'Tatsumaki::Handler';

sub get {
  my $self = shift;
  $self->write("Hello ", $self->request->user);
}

use Tatsumaki::Application;
my $app = Tatsumaki::Application->new([
  '/hello' => 'Hello',
]);

#$app->psgi_app;

use Plack::Middleware::Auth::Basic;
$app = Plack::Middleware::Auth::Basic->wrap(
  $app->psgi_app,
  authenticator => sub {
    my($user, $pass) = @_;
    return $user eq 'admin' && $pass eq 'gihyo';
  },
);

