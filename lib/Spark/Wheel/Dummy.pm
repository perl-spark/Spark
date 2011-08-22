package Spark::Wheel::Dummy;

use Moose;

with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub {
        require Spark::Wheel::Dummy::Renderer::HTML;
        Spark::Wheel::Dummy::Renderer::HTML->new;
    },
);

__PACKAGE__->meta->make_immutable;

1;
__END__
