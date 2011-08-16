package Spark::Wheel::Text;

use Moose;
extends 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::Text::Renderer::HTML->new; }
);

1;
__END__
