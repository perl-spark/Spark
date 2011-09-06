#!perl

use strict;
use warnings;

use Test::More;
use Spark::Wheel::RadioGroup;
use Spark::Hashray;

my $data = Spark::Hashray->new();

pass('');

TODO: {
    local $TODO = 'Needs more fleshing out';
{
    my $b = Spark::Wheel::RadioGroup->new;
    is($b->render($b, $data), 'FAIL', 'Test html representation without name');
}
{
    my $b = Spark::Wheel::RadioGroup->new(name => 'test');
    is($b->name, 'test', "Name stored correctly");
    is($b->render($b, $data), 'FAIL', 'Test html representation with name');
}
};
done_testing;
