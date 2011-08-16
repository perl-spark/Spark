package Spark::Wheel::Textarea;

use Moose;
extends 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::Textarea::Renderer->new; }
);

1;
__END__
