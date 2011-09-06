#!perl

use strict;
use warnings;

use Test::More;
use Spark::Wheel::Checkbox;
use Spark::Hashray;

my $data = Spark::Hashray->new();

{
    my $b = Spark::Wheel::Checkbox->new;
    is($b->render($b, $data), '<input type="checkbox" />', 'Test html representation without name');
}
{
    my $b = Spark::Wheel::Checkbox->new(name => 'test');
    is($b->name, 'test', "Name stored correctly");
    is($b->render($b, $data), '<input name="test" type="checkbox" />', 'Test html representation with name');
}

done_testing;
