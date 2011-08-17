package Spark::Wheel::Dummy;

use Moose;

use Carp;
extends 'Spark::Simple::Field';

has '+renderer' => (
    required => 0,
);

sub render {
    croak("Don't render me");
}

__PACKAGE__->meta->make_immutable;

1;
__END__
