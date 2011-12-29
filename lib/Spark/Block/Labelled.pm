use strict;
use warnings;

package Spark::Block::Labelled;

use Moose::Role;
use namespace::autoclean;

has label => (
    is      => 'rw',
    default => undef,
);

1;
__END__
