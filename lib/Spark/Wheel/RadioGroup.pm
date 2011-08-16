package Spark::Wheel::RadioGroup;

use Moose;
extends 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::RadioGroup::Renderer->new; }
);

1;
__END__
