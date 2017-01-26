#!/usr/bin/env perl
use Mojolicious::Lite;

# Documentation browser under "/perldoc"
plugin 'PODRenderer';

my $title = 'Hello FizzBuzz';
my $name = 'sela';
my $hoby = 'Slackline';
my $language = 'Perl';
get '/' => sub {
  my $c = shift;
  $c->stash(
    title => $title,
    name  => $name,
    hoby  => $hoby,
    language => $language,
  );
  $c->render(template => 'fizzbuzz');
  #$c->render(template => 'profile');
  #$c->render(template => 'index');
};

app->start;
__DATA__

@@ fizzbuzz.html.ep
<html>
<head><title><%= $title%></title></head>
<body style = 'padding: 20px;'>
% foreach my $num (1 .. 100){
%   if ($num % 3 == 0 && $num % 5 == 0){
      fizzbuzz <%= $num %><br>
%   }elsif($num % 3 == 0){
      fizz <%= $num %><br>
%   }elsif($num % 5 == 0){
      buzz <%= $num %><br>
%   }else{
      <%= $num %><br>
%   }
% }
</body>
</html>

@@ profile.html.ep
<html>
<head><title><%= $name %>のプロフィール</title></head>
<body style ='padding: 30px;'>
  私の名前は <%= $name %> です.<br>
  趣味は<%= $hoby %>で, 好きなプログラミング言語は<%= $language %> です.
</body>
</html>

@@ index.html.ep
% layout 'default';
<h1>Welcome to the Mojolicious real-time web framework!</h1>
To learn more, you can browse through the documentation
<%= link_to 'here' => '/perldoc' %>.

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
