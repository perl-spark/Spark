use strict;
use warnings;

package Spark::Wheel::Checkbox;

use Moose;

with 'Spark::Simple::Field';
use namespace::autoclean;

has '+renderer' => (
    default => sub {
        require Spark::Wheel::Checkbox::Renderer::HTML;
        Spark::Wheel::Checkbox::Renderer::HTML->new;
    },
);

__PACKAGE__->meta->make_immutable;
1;
__END__
