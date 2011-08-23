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

sub gen_data {
  my ( $prefix, $offset, $name ) = @_ ;
  return (
    $prefix . q{::} . $modules[$offset],
    $load->package( $modules[$offset] ),
    $load->make( $modules[$offset], name => $name ),
  );
}
sub test_data {
  my ( $expected, $pack, $object, $name ) = @_ ;
  subtest "$name" => sub {
    is ( $pack, $expected, "Loaded the correct $name");
    isa_ok( $object, $expected, "Created the correct $name");
    is( $object->name, $name, "Object for $name has the right name");
  };
}

{
  my ( $expected , $pack, $obj ) = gen_data( "Spark::Wheel",  0, 'foo' );
  test_data( $expected, $pack, $obj, 'foo');
}

{
  $load->add_namespace('Test::Spark::Load::Field');
  my ( $expected , $pack, $obj ) = gen_data( "Test::Spark::Load::Field",  1, 'bar' );
  test_data( $expected, $pack, $obj, 'bar');
}

{
  $load->add_namespace('Test::Spark::Field');
  my ( $expected , $pack, $obj ) = gen_data( "Test::Spark::Field",  2, 'baz' );
  test_data( $expected, $pack, $obj, 'baz');
}

# Quux doesn't actually exist
is( exception { $load->make($modules[3]) }, undef, 'Failed to load nonexistent module');

done_testing;
