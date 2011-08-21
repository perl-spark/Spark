package Spark::Wheel::Radio;

use Moose;
use Spark::Wheel::Radio::Renderer::HTML;
with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::Radio::Renderer::HTML->new; }
);

__PACKAGE__->meta->make_immutable;

1;
__END__
