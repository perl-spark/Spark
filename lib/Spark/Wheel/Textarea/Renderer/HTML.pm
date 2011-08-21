package Spark::Wheel::Textarea::Renderer::HTML;

use 5.010001;    # // syntax.

use Moose;
use HTML::Tiny;

with 'Spark::Renderer';

sub render {
    my ($self, $node, $data) = @_;
    my %attributes;
    $attributes{name} = $node->name if defined $node->name;

    my @attribute_strings = (q{}, map { sprintf q{%s="%s"}, $_, $attributes{$_} } keys %attributes);

    return sprintf '<textarea%s>%s</textarea>',
      (join q{ }, @attribute_strings),
      ($data->get_one($node->name) // q{});
}

__PACKAGE__->meta->make_immutable;

1;
__END__
