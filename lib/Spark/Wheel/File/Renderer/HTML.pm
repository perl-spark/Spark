use strict;
use warnings;

package Spark::Wheel::File::Renderer::HTML;

use Moose;
with 'Spark::Renderer';
use namespace::autoclean;

sub render {
    my ($self, $node, $data) = @_;
    require HTML::Tiny;
    return HTML::Tiny->new->input({type => 'file', name => $node->name});
}

__PACKAGE__->meta->make_immutable;

1;

