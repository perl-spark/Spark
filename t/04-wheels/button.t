#!perl

use Test::More;
use Spark::Wheel::Button;
use Spark::Hashray;

my $data = Spark::Hashray->new();

{
    my $b = new_ok("Spark::Wheel::Button");
    is($b->render($b,$data),'<button></button>','Test html representation without name');
}
{
    my $b = Spark::Wheel::Button->new(name => 'test');
    is($b->name,'test',"Name stored correctly");
}
{
    my $b = Spark::Wheel::Button->new(name => 'test');
    is($b->render($b,$data),'<button name="test"></button>','Test html representation with name');
}

done_testing;
