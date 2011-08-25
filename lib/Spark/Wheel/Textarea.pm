use strict;
use warnings;

package Spark::Wheel::Textarea;

use Moose;
with 'Spark::Simple::Field';
use namespace::autoclean;

has '+renderer' => (
    default => sub {
        require Spark::Wheel::Textarea::Renderer::HTML;
        Spark::Wheel::Textarea::Renderer::HTML->new;
      }
);

__PACKAGE__->meta->make_immutable;

1;
__END__
