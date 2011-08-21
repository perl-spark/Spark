package Spark::Wheel::Dummy;

use Moose;
with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::Dummy::Renderer->new; }
);

1;
__END__
