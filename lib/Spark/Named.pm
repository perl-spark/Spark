package Spark::Named;

use Moose::Role;

has name => (
    is => 'rw',
    default => null,
);

1;
__END__
