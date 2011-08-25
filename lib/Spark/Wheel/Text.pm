use strict;
use warnings;

package Spark::Wheel::Text;

use Moose;
with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub {
        require Spark::Wheel::Text::Renderer::HTML;
        Spark::Wheel::Text::Renderer::HTML->new;
    },
);

__PACKAGE__->meta->make_immutable;

1;
__END__
