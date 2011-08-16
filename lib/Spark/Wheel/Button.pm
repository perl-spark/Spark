package Spark::Wheel::Button;

use Moose;
with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::Button::Renderer->new; }
);

1;
__END__
