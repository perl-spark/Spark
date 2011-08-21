package Spark::Wheel::Submit;

use Moose;
use Spark::Wheel::Submit::Renderer;
with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::Submit::Renderer->new; }
);

__PACKAGE__->meta->make_immutable;

1;
__END__
