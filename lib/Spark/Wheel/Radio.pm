use strict;
use warnings;

package Spark::Wheel::Radio;

use Moose;
with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub {
        require Spark::Wheel::Radio::Renderer::HTML;
        Spark::Wheel::Radio::Renderer::HTML->new;
    },
);

__PACKAGE__->meta->make_immutable;

1;
__END__
