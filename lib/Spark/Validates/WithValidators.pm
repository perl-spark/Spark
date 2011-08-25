use strict;
use warnings;

package Spark::Validates::WithValidators;
use Moose;
use MooseX::Types::Moose qw( :all );
use Spark::Types qw( :all );
with 'Spark::Validates', 'Spark::Node';

has _validators => (
    isa => ArrayRef [SparkFormFieldValidator],
    is => 'rw',
    default => sub { [] },
    traits  => ['Array'],
    handles => {
        'validators' => 'elements',
    },
);

__PACKAGE__->meta->make_immutable;
1;

