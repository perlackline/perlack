my $app = sub {
  my $env = shift;
  return [
    200,
    [ 'Content-Type' => 'text/plain' ],
    [ "Hello $env->{REMOTE_ADDR}" ],
  ];
};

my $mw = sub {
  my $env = shift;
  $env->{REMOTE_ADDR} = '1.2.3.4' if rand(1) > 0.5;
  $app->($env);
};
