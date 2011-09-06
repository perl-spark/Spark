use strict;
use warnings;

package Spark::Validator::FieldMethod;
{
  $Spark::Validator::FieldMethod::VERSION = '0.1.0';
}

use Moose;
use namespace::autoclean;

with 'Spark::Simple::Validator';

sub _validate {
    my ($self, $context) = @_;

    ## no critic (ProtectPrivateSubs)
    return $context->node->_validate($context)
      if ($context->node->can('_validate'));

    return;
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;


=pod

=encoding utf-8

=head1 NAME

Spark::Validator::FieldMethod

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
