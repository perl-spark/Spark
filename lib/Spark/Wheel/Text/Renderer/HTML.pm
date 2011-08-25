use strict;
use warnings;

package Spark::Wheel::Text::Renderer::HTML;

use Moose;
with 'Spark::Renderer';

sub render {
    my ($self, $node, $data) = @_;
    my %options = (type => 'text', name => $node->name);
    if (defined $node->name) {
        $options{value} = $data->get_one($node->name);
    }
    require HTML::Tiny;
    return HTML::Tiny->new->input(\%options);
}

__PACKAGE__->meta->make_immutable;

1;
