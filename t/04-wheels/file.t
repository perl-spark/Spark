#!perl

use strict;
use warnings;

use Test::More;
use Spark::Wheel::File;
use Spark::Hashray;

my $data = Spark::Hashray->new();

{
    my $b = Spark::Wheel::File->new;
    is($b->render($b, $data), '<input type="file" />', 'Test html representation without name');
}
{
    my $b = Spark::Wheel::File->new(name => 'test');
    is($b->name, 'test', "Name stored correctly");
    is($b->render($b, $data), '<input name="test" type="file" />', 'Test html representation with name');
}

done_testing;
