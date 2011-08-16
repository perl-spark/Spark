package Spark::Wheel::Hidden;

use Moose;
extends 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::Hidden::Renderer->new; }
);

1;
__END__
