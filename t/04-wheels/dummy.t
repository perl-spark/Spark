#!perl

use strict;
use warnings;

use Test::More;
use Test::Fatal;
use Spark::Wheel::Dummy;
use Spark::Hashray;

my $data = Spark::Hashray->new;
{
    my $b = Spark::Wheel::Dummy->new;
    ok( exception {$b->render($b, $data)} );
}

done_testing;
