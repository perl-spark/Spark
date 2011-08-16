package Spark::Wheel::Checkbox;

use Moose;
extends 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::Checkbox::Renderer->new; }
);

1;
__END__
