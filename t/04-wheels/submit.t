#!perl

use strict;
use warnings;

use Test::More;
use Spark::Wheel::Submit;
use Spark::Hashray;

my $data = Spark::Hashray->new();

{
    my $b = Spark::Wheel::Submit->new;
    is($b->render($b, $data), '<input type="submit" />', 'Test html representation without name');
}
{
    my $b = Spark::Wheel::Submit->new(name => 'test');
    is($b->name, 'test', "Name stored correctly");
    is($b->render($b, $data), '<input name="test" type="submit" />', 'Test html representation with name');
}

done_testing;
