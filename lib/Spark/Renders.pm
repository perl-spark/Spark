use strict;
use warnings;

package Spark::Renders;

use Moose::Role;
use Spark::Types qw(:all);
use namespace::autoclean;

has renderer => (
    isa      => SparkRenderer,
    is       => 'rw',
    required => 1,
);

sub render {
    my ($self, $node, $data, @args) = @_;
    return $self->renderer->render($node, $data, @args);
}

1;
__END__
