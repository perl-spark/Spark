use strict;
use warnings;

package Spark::Simple::Validator;

use Moose::Role;
use namespace::autoclean;

use Spark::Result;

with 'Spark::Validator';

requires '_validate';

sub validate {
    my ($self, $context) = @_;
    my $result = Spark::Result->new;
    $result->error($_, $context)
	for $self->_validate($context);
    $result;
}
1;
__END__


