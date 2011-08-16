package Spark::Wheel::Radio;

use Moose;
extends 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::Radio::Renderer->new; }
);

1;
__END__
