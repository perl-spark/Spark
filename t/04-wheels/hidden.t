#!perl

use strict;
use warnings;

use Test::More;
use Spark::Wheel::Hidden;
use Spark::Hashray;

my $data = Spark::Hashray->new();

{
    my $b = Spark::Wheel::Hidden->new;
    is($b->render($b, $data), '<input type="hidden" />', 'Test html representation without name');
}
{
    my $b = Spark::Wheel::Hidden->new(name => 'test');
    is($b->name, 'test', "Name stored correctly");
    is($b->render($b, $data), '<input name="test" type="hidden" />', 'Test html representation with name');
}

done_testing;
