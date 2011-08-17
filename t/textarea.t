#!perl -T

use Test::More;
use Spark::Wheel::Textarea;
use Spark::Hashray;

my $data = Spark::Hashray->new();

{
    my $t = new_ok("Spark::Wheel::Textarea");
    is($t->renderer->render($t,$data),'<textarea></textarea>','Test html representation without name');
}


{
    my $t = Spark::Wheel::Textarea->new(name=>"test");
    is($t->renderer->render($t,$data),'<textarea name="test"></textarea>','Test html representation with name');
    is($t->name,'test',"Name stored correctly");
    $data->push("test",123);
    is($t->renderer->render($t,$data),'<textarea name="test">123</textarea>','Test html representation with name and value');
}

{
    my $t = Spark::Wheel::Textarea->new(name=>"0");
    is($t->name,'0',"Name stored correctly");
    $data->push("0",0);
    is($t->renderer->render($t,$data),'<textarea name="0">0</textarea>','False name handled correctly');
}

done_testing;
