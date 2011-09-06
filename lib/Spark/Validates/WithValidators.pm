use strict;
use warnings;

package Spark::Validates::WithValidators;
use Moose::Role;
use MooseX::Types::Moose qw( :all );
use Spark::Types qw( :all );
use namespace::autoclean;

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

1;

