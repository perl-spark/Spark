use strict;
use warnings;

package Spark::Wheel::MultiSelect;

use Moose;
with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub {
        require Spark::Wheel::MultiSelect::Renderer::HTML;
        Spark::Wheel::MultiSelect::Renderer::HTML->new;
    },
);

__PACKAGE__->meta->make_immutable;

1;
__END__
