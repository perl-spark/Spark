package Spark::Wheel::Button;

use Moose;
use Spark::Wheel::Button::Renderer::HTML;
with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::Button::Renderer::HTML->new; }
);

__PACKAGE__->meta->make_immutable;

1;
__END__
