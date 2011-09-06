#!perl

use strict;
use warnings;

use Test::More;
use Spark::Wheel::Text;
use Spark::Hashray;

my $data = Spark::Hashray->new();

{
    my $t = new_ok("Spark::Wheel::Text");
    is($t->renderer->render($t, $data), '<input type="text" />', 'Test html representation without name');
}

{
    my $t = Spark::Wheel::Text->new(name => "test");
    is($t->renderer->render($t, $data), '<input name="test" type="text" />', 'Test html representation with name');
    is($t->name, 'test', "Name stored correctly");
    $data->push("test", 123);
    is($t->renderer->render($t, $data), '<input name="test" type="text" value="123" />', 'Test html representation with name and value');
}

done_testing;
