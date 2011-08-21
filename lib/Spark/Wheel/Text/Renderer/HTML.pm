package Spark::Wheel::Text::Renderer::HTML;

use Moose;
use HTML::Tiny;
with 'Spark::Renderer';

sub render {
    my ($self, $node, $data) = @_;
    my %options = (type => 'text', name => $node->name);
    if (defined $node->name) {
        $options{value} = $data->get_one($node->name);
    }
    return HTML::Tiny->new->input(\%options);
}

__PACKAGE__->meta->make_immutable;

1;
