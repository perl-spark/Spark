package Spark::Validates::WithValidators;

with 'Spark::Validates','Spark::Node';

has _validators => (
    isa     => 'ArrayRef[Spark::Form::Field::Validator]',
    is      => 'rw',
    default => sub { [] },
    traits  => ['Array'],
    handles => {
        'validators' => 'elements',
      }
);

