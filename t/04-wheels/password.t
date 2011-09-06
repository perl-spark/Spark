#!perl

use strict;
use warnings;

use Test::More;
use Spark::Wheel::Password;
use Spark::Hashray;

my $data = Spark::Hashray->new();

{
    my $b = Spark::Wheel::Password->new;
    is($b->render($b, $data), '<input type="password" />', 'Test html representation without name');
}
{
    my $b = Spark::Wheel::Password->new(name => 'test');
    is($b->name, 'test', "Name stored correctly");
    is($b->render($b, $data), '<input name="test" type="password" />', 'Test html representation with name');
}

done_testing;
