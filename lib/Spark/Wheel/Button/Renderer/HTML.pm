package Spark::Wheel::Button::Renderer::HTML;

use Moose;
use HTML::Tiny;
with 'Spark::Renderer';

sub render {
    my ($self,$node,$data) = @_;
    my %flags;
    if ($node->can('name')) {
        $flags{name} = $data->get($node->name);
    }
    return HTML::Tiny->new->button({%flags});
}
