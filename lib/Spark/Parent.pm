package Spark::Parent;

use Moose::Role;
use MooseX::Types::Moose qw( :all );
use namespace::autoclean;
with 'Spark::Field';

has children => (
    isa     => ArrayRef,
    traits  => ['Array'],
    handles => {
        _add_child => 'push',
    },
);

1;
__END__
