use strict;
use warnings;

package Spark::Wheel::Select;

use Moose;
with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub {
        require Spark::Wheel::Select::Renderer::HTML;
        Spark::Wheel::Select::Renderer::HTML->new;
    },
);

__PACKAGE__->meta->make_immutable;

1;
__END__
