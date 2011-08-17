package Spark::Parent;

use Moose::Role;
with 'Spark::Field';

has children => (
    isa => 'ArrayRef',
    traits => ['Array'],
    handles => {
        _add_child => 'push',
    },
);

1;
__END__
