package Spark::Renders;

use Moose::Role;
use Spark::Types qw(:all);

has renderer => (
    isa => SparkRenderer,
    is => 'rw',
    required => 1,
);

1;
__END__
