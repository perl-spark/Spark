package Spark::Wheel::Dummy;

use Moose;
use Spark::Wheel::Dummy::Renderer::HTML;

with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::Dummy::Renderer->new; }
);

__PACKAGE__->meta->make_immutable;

1;
__END__
