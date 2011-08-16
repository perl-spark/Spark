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

$ray->pairwise("foo",999,"baz",124,"baz",888,"baz2",87);

is_deeply [$ray->get("foo")],[123,789,999],"pairwise adds to an existing key";
is_deeply [$ray->get("baz")],[124,888],"pairwise creates a new key with 2 values";
is_deeply [$ray->get("baz2")],[87],"pairwise creates a new key with 1 value";

done_testing;
