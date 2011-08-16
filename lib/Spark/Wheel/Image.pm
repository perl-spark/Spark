package Spark::Wheel::Image;

use Moose;
extends 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::Image::Renderer->new; }
);

1;
__END__
