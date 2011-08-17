package Spark::Wheel::Textarea::Renderer::HTML;

use Moose;
use HTML::Tiny;
with 'Spark::Renderer';

sub render {
    my ($self,$node,$data) = @_;
    '<textarea' . (defined $node->name ? ' name="' . $node->name . '"' : '') . '>' . ($data->get_one($node->name)//'') . '</textarea>';
}

1;
__END__
