#!perl

use strict;
use warnings;

use Test::More;
use Spark::Wheel::Select;
use Spark::Hashray;

my $data = Spark::Hashray->new();

{
    my $b = Spark::Wheel::Select->new;
    is($b->render($b, $data), '<select></select>', 'Test html representation without name');
}
{
    my $b = Spark::Wheel::Select->new(name => 'test');
    is($b->name, 'test', "Name stored correctly");
    is($b->render($b, $data), '<select name="test"></select>', 'Test html representation with name');
}

done_testing;
