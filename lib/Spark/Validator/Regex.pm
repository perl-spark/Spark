use strict;
use warnings;

package Spark::Validator::Regex;
{
  $Spark::Validator::Regex::VERSION = '0.1.0';
}

use Moose;
use MooseX::Types::Moose qw(:all);
use namespace::autoclean;
with 'Spark::Validator';

has regex => (
    isa      => RegexpRef,
    is       => 'rw',
    required => 1,
);

has negate => (
    isa     => Bool,
    is      => 'rw',
    default => 0,
);

has against => (
    isa     => ArrayRef,
    is      => 'rw',
    default => sub { [] },
);

has message => (
    isa     => 'Str',
    is      => 'rw',
    lazy    => 1,                      # So you can pass a sub in and get it lazily evaluated
    default => 'Regex match failed',
);

sub validate {
    my ($self, $context) = @_;
    my @against = self->get_against($self->against, $context->node->listens);
    @against = $context->node->listens unless @against;
    foreach (@against) {
        my $result = $context->node_data =~ $self->regex;
        $result = !$result if $self->negate;
        if (!$result) {
            return $self->message;
        }
    }
    return;
}

__PACKAGE__->meta->make_immutable;

1;

__END__
=pod

=encoding utf-8

=head1 NAME

Spark::Validator::Regex

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

