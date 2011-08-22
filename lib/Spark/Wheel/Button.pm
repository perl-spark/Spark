package Spark::Wheel::Button;

use Moose;
with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub {
        require Spark::Wheel::Button::Renderer::HTML;
        Spark::Wheel::Button::Renderer::HTML->new;
    },
);

__PACKAGE__->meta->make_immutable;

1;
__END__
