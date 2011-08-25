use strict;
use warnings;

package Spark::Wheel::Hidden;

use Moose;

with 'Spark::Simple::Field';
use namespace::autoclean;

has '+renderer' => (
    default => sub {
        require Spark::Wheel::Hidden::Renderer::HTML;
        Spark::Wheel::Hidden::Renderer::HTML->new;
    },
);

__PACKAGE__->meta->make_immutable;

1;
__END__
