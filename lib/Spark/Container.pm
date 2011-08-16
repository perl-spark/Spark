package Spark::Container;

use Moose::Role;
use MooseX::Types::Moose qw(ArrayRef);

has children => (
    isa => OrderedHash,
    is => 'ro',
    handles => {
    }
);

1;
__END__

