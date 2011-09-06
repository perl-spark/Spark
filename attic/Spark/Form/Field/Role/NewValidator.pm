use strict;
use warnings;

package Spark::Form::Field::Role::NewValidator;

use Moose::Role;
use Spark::Types ':all';
use MooseX::Types::Moose ':all';
use namespace::autoclean;

requires '_validate';

has _validators => (
    isa => ArrayRef [SparkFormFieldValidator],
    is => 'rw',
    init_arg => undef,
    default  => sub { [] },
    traits   => ['Array'],
    handles  => {
        validators => 'elements',
    },
);

after _validate => sub {
    my ($self) = @_;
    $_->validate for $self->validators;
};

1;
__END__
