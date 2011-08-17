package Spark::Wheel::Button::Renderer::HTML;

use Moose;
use HTML::Tiny;
with 'Spark::Renderer';

sub render {
    my ($self,$node,$data) = @_;
    return HTML::Tiny->new->button({name=>$node->name});
}
