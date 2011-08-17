package Spark::Field::Container;

use Moose::Role;
does 'Spark::Field';

has children => (
    isa => 'ArrayRef',
    traits => ['Array'],
    handles => {
        _add_child => 'push',
    },
);

1;
__END__
