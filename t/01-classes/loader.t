use strict;
use warnings;

use Test::More;
use Test::Fatal;

use lib 't/lib';

use Spark::Load;

my $load = Spark::Load->new;

my @modules = ( #produced with echo -n $word | shasum
    '0beec7b5ea3f0fdbc95d0dd47f3c5bc275da8a33', # foo
    '62cdb7020ff920e5aa642c3d4066950dd1f01f4d', # bar
    'bbe960a25ea311d21d40669e93df2003ba9b90a2', # baz
    'ae2ad9454f3af7fcb18c83969f99b20a788eddd1', # quux
);

my $foo_expected = "Spark::Wheel::@{[$modules[0]]}";
my $foo_pack = $load->package($modules[0]);
my $foo_obj = $load->make($modules[0], name => 'foo');
is($foo_pack, $foo_expected, "Loaded the correct foo");
isa_ok($foo_obj, $foo_expected, "Created the correct foo");
is($foo_obj->name, 'foo');

$load->add_namespace('Test::Spark::Load::Field');
my $bar_expected = "Test::Spark::Load::Field::@{[$modules[1]]}";
my $bar_pack = $load->package($modules[1]);
my $bar_obj = $load->make($modules[1], name => 'bar');
is($bar_pack, $bar_expected, "Loaded the correct bar");
isa_ok($bar_obj, $bar_expected, "Created the correct bar");
is($bar_obj->name, 'bar');

$load->add_namespace('Test::Spark::Field');
my $baz_expected = "Test::Spark::Field::@{[$modules[2]]}";
my $baz_pack = $load->package($modules[2]);
my $baz_obj = $load->make($modules[2]);
is($baz_pack, $baz_expected, "Loaded the correct baz");
isa_ok($baz_obj, $baz_expected, "Created the correct baz");

# Quux doesn't actually exist
is( exception { $load->make($modules[3]) }, undef, 'Failed to load nonexistent module');

done_testing;
