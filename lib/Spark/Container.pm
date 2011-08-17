package Spark::Container;

use Moose::Role;
use Spark::Types qw(Hashray);

has children => (
    isa     => Hashray,
    is      => 'ro',
    handles => {
    },
);

1;
__END__

