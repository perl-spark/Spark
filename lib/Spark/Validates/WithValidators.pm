package Spark::Validates::WithValidators;
use Moose;
with 'Spark::Validates', 'Spark::Node';

has _validators => (
    isa     => 'ArrayRef[Spark::Form::Field::Validator]',
    is      => 'rw',
    default => sub { [] },
    traits  => ['Array'],
    handles => {
        'validators' => 'elements',
      }
);

__PACKAGE__->meta->make_immutable;
1;

