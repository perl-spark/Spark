use strict;
use warnings;

package Spark::Validator::FieldMethod;

use Moose;
use namespace::autoclean;

with 'Spark::Simple::Validator';

sub _validate {
    my ($self, $context) = @_;

    ## no critic (ProtectPrivateSubs)
    return $context->node->_validate($context)
      if ($context->node->can('_validate'));

    return;
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;
__END__
