use strict;
use warnings;

package Spark::Wheel::Image;

use Moose;

with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub {
        require Spark::Wheel::Image::Renderer::HTML;
        Spark::Wheel::Image::Renderer::HTML->new;
    },
);

__PACKAGE__->meta->make_immutable;

1;
__END__
