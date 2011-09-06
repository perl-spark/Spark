use strict;
use warnings;

package Spark::Validator::FieldMethod;

use Moose;
use namespace::autoclean;

with 'Spark::Simple::Validator';

sub _validate {
    my ($self, $context) = @_;

    return $context->node->_validate($context)
	if ($context->node->can('_validate'));
}

1;
__END__
