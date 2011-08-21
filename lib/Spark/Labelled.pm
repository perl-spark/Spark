package Spark::Labelled;

use Moose::Role;

has label => (
    is      => 'rw',
    default => undef,
);

1;
__END__
