package Spark::Wheel::File;

use Moose;

with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub {
        require Spark::Wheel::File::Renderer::HTML;
        Spark::Wheel::File::Renderer::HTML->new;
    },
);

__PACKAGE__->meta->make_immutable;

1;
__END__
