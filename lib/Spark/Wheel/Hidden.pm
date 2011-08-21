package Spark::Wheel::Hidden;

use Moose;
use Spark::Wheel::Hidden::Renderer::HTML;

with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::Hidden::Renderer::HTML->new; }
);

__PACKAGE__->meta->make_immutable;

1;
__END__
