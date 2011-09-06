#!perl

use strict;
use warnings;

use Test::More;
use Spark::Wheel::Reset;
use Spark::Hashray;

my $data = Spark::Hashray->new();

{
    my $b = Spark::Wheel::Reset->new;
    is($b->render($b, $data), '<input type="reset" />', 'Test html representation without name');
}
{
    my $b = Spark::Wheel::Reset->new(name => 'test');
    is($b->name, 'test', "Name stored correctly");
    is($b->render($b, $data), '<input name="test" type="reset" />', 'Test html representation with name');
}

done_testing;
