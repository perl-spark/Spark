use strict;
use warnings;

package Spark::Wheel::Dummy;

use Moose;

with 'Spark::Simple::Field';

has '+renderer' => (
    required => 0,
);

sub render {
    require Carp;
    Carp::croak(q{Don't render me});
}

__PACKAGE__->meta->make_immutable;

1;
__END__
