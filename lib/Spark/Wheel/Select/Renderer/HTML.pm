use strict;
use warnings;

package Spark::Wheel::Select::Renderer::HTML;

use Moose;
with 'Spark::Renderer';
use namespace::autoclean;

sub render {
    my ($self, $node, $data) = @_;

    require HTML::Tiny;
    return HTML::Tiny->new->button({name => $node->name});
}

__PACKAGE__->meta->make_immutable;

1;

