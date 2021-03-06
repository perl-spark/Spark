use strict;
use warnings;

package Spark::Wheel::Submit;

use Moose;
with 'Spark::Simple::Field';
use namespace::autoclean;

has '+renderer' => (
    default => sub {
        require Spark::Wheel::Submit::Renderer::HTML;
        Spark::Wheel::Submit::Renderer::HTML->new;
      }
);

__PACKAGE__->meta->make_immutable;

1;
__END__
