package Spark::Wheel::Password;

use Moose;
extends 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::Password::Renderer->new; }
);

1;
__END__
