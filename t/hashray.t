use Test::More;

use Spark::Hashray;

# Cock. Can't we just steal the tests from Data::Couplet?
my $ray = new_ok("Spark::Hashray");
is_deeply [$ray->get("foo")],[];
is_deeply [$ray->get_one("foo")],[undef];
$ray->push("foo",123);
$ray->push("bar",456);
is_deeply [$ray->get("foo")],[123];
is_deeply [$ray->get("bar")],[456];
$ray->push("foo",789);
is_deeply [$ray->get("foo")],[123,789];

is_deeply [$ray->get_one("foo")],[123],"get_one in list context";
is_deeply $ray->get_one("foo"),123,"get_one in scalar context";

$ray->push("foo",999,"baz",124,"baz",888,"baz2",87);

is_deeply [$ray->get("foo")],[123,789,999],"push adds to an existing key";
is_deeply [$ray->get("baz")],[124,888],"push creates a new key with 2 values";
is_deeply [$ray->get("baz2")],[87],"push creates a new key with 1 value";

eval {
    $ray->push("an","odd","number","of","arguments");
};
like $@,qr/needs an even number of arguments/,"push with an odd number of arguments throws an exception";

eval {
    Spark::Hashray->new("an","odd","number","of","arguments");
};
like $@,qr/needs an even number of arguments/,"new with an odd number of arguments throws an exception";

{
    my $new_hashray = 
        Spark::Hashray->new("foo",55,"foo",["value1","value2"],"bar",66);
    is_deeply [$new_hashray->get("foo")],[55,["value1","value2"]];
    is_deeply [$new_hashray->get("bar")],[66];
}

done_testing;
