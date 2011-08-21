package Spark::Wheel::Hidden;

use Moose;
use Spark::Wheel::Hidden::Renderer;

with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::Hidden::Renderer->new; }
);

__PACKAGE__->meta->make_immutable;

1;
__END__
