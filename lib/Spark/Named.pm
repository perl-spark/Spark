use strict;
use warnings;

package Spark::Named;

use Moose::Role;

has name => (
    is      => 'rw',
    default => undef,
);

1;
__END__
