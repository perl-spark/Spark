#!perl

use strict;
use warnings;

use Test::More;
use Spark::Wheel::Image;
use Spark::Hashray;

my $data = Spark::Hashray->new();

{
    my $b = Spark::Wheel::Image->new;
    is($b->render($b, $data), '<input type="image" />', 'Test html representation without name');
}
{
    my $b = Spark::Wheel::Image->new(name => 'test');
    is($b->name, 'test', "Name stored correctly");
    is($b->render($b, $data), '<input name="test" type="image" />', 'Test html representation with name');
}

done_testing;
