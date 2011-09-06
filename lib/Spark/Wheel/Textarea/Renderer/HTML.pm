use strict;
use warnings;

package Spark::Wheel::Textarea::Renderer::HTML;
{
  $Spark::Wheel::Textarea::Renderer::HTML::VERSION = '0.1.0';
}

use 5.010001;    # // syntax.

use Moose;
use namespace::autoclean;
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


=pod

=encoding utf-8

=head1 NAME

Spark::Wheel::Textarea::Renderer::HTML

=head1 VERSION

version 0.1.0

=head1 AUTHORS

=over 4

=item *

James Laver L<http://jameslaver.com>

=item *

Kent Fredric <kentnl@cpan.org>

=item *

Paweł Murias <pawelmurias@gmail.com>

=item *

David Dorward <david@dorward.me.uk>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by James Laver C<< <sprintf qw(%s@%s.%s cpan jameslaver com)> >>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__END__
