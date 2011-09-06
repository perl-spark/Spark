use strict;
use warnings;

package Spark::Wheel::Radio::Renderer::HTML;

use Moose;
with 'Spark::Renderer';
use namespace::autoclean;

sub render {
    my ($self, $node, $data) = @_;
    require HTML::Tiny;
    return HTML::Tiny->new->input({type => 'radio', name => $node->name});
}

__PACKAGE__->meta->make_immutable;

1;

