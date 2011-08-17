#!perl

use Test::More;
use Spark::Wheel::Button;
use Spark::Hashray;

my $data = Spark::Hashray->new();

{
    my $b = new_ok("Spark::Wheel::Button");
    is($b->renderer->render($b,$data),'<button></button>','Test html representation without name');
}
{
    my $b = Spark::Wheel::Button->new(name => 'test');
    is($b->renderer->render($b,$data),'<button name="test"></button>','Test html representation with name');
}

#$b->render
#my $b2 = SparkX::Form::Field::Button->new(
#    name => 'test', form => $form,
#    content=>'<img src="foo" />'
#);
#is($b->to_xhtml,'<button name="test"></button>','Test xhtml representation');
#is($b2->to_xhtml,'<button name="test"><img src="foo" /></button>','Test xhtml representation');
done_testing;
