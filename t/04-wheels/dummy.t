#!perl

use strict;
use warnings;

use Test::More;
use Test::Exception;
use Spark::Wheel::Dummy;
use Spark::Hashray;

my $data = Spark::Hashray->new;
{
    my $b = Spark::Wheel::Dummy->new;
    dies_ok {$b->render($b, $data)};
}

done_testing;
