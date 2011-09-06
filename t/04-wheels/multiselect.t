#!perl

use strict;
use warnings;

use Test::More;
use Spark::Wheel::MultiSelect;
use Spark::Hashray;

my $data = Spark::Hashray->new();

{
    my $b = Spark::Wheel::MultiSelect->new;
    is($b->render($b, $data), '<select multiple="multiple"></select>', 'Test html representation without name');
}
{
    my $b = Spark::Wheel::MultiSelect->new(name => 'test');
    is($b->name, 'test', "Name stored correctly");
    is($b->render($b, $data), '<select multiple="multiple" name="test"></select>', 'Test html representation with name');
}

done_testing;
