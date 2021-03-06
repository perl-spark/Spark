use strict;
use warnings;

package Spark::Block::Named;

use Moose::Role;
use namespace::autoclean;

has name => (
    is      => 'rw',
    default => undef,
);

1;
__END__
