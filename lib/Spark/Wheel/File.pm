package Spark::Wheel::File;

use Moose;
extends 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::File::Renderer->new; }
);

1;
__END__
