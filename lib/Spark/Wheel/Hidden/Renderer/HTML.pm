package Spark::Wheel::Hidden::Renderer::HTML;

use Moose;
use HTML::Tiny;
with 'Spark::Renderer';

sub render {
    my ($self, $node, $data) = @_;
    return HTML::Tiny->new->button({name => $node->name});
}

__PACKAGE__->meta->make_immutable;

1;

