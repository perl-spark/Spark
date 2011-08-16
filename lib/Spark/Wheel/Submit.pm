package Spark::Wheel::Submit;

use Moose;
extends 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::Submit::Renderer->new; }
);

1;
__END__
