#!perl

use Test::More;
use Spark::Wheel::Button;

my $b = new_ok("Spark::Wheel::Button",[name => 'test']);
#$b->render
#my $b2 = SparkX::Form::Field::Button->new(
#    name => 'test', form => $form,
#    content=>'<img src="foo" />'
#);
#is($b->to_xhtml,'<button name="test"></button>','Test xhtml representation');
#is($b2->to_xhtml,'<button name="test"><img src="foo" /></button>','Test xhtml representation');
done_testing;
