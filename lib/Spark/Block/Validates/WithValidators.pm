use strict;
use warnings;

package Spark::Block::Validates::WithValidators;
use Moose::Role;
use MooseX::Types::Moose qw( :all );
use Spark::Types qw( :all );
use namespace::autoclean;

with 'Spark::Role::Validates', 'Spark::Node';

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

