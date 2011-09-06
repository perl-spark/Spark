use strict;
use warnings;

package Spark::Simple::Validator;

use Moose::Role;
use namespace::autoclean;

use Spark::Result;

with 'Spark::Validator';

sub validate {
    my ($self, $context) = @_;
    my $result = Spark::Result->new;
    die('Must implement _validate') unless $self->can('_validate');
    map {
        $result->add_error($_, $context);
    } $self->_validate($context);
    $result;
}
1;
__END__


