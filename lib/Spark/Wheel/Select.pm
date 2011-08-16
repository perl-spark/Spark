package Spark::Wheel::Select;

use Moose;
extends 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::Select::Renderer->new; }
);

1;
__END__
