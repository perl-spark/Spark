use strict;
use warnings;

package Spark::Wheel::Password;

use Moose;
use namespace::autoclean;
with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub {
        require Spark::Wheel::Password::Renderer::HTML;
        Spark::Wheel::Password::Renderer::HTML->new;
    },
);

__PACKAGE__->meta->make_immutable;

1;
__END__
