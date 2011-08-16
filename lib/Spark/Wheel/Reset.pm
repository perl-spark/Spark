package Spark::Wheel::Reset;

use Moose;
extends 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::Reset::Renderer->new; }
);

1;
__END__
