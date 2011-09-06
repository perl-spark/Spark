use strict;
use warnings;

package Spark::Field::Named;
{
  $Spark::Field::Named::VERSION = '0.1.0';
}

use Moose::Role;
use MooseX::Types::Moose qw( :all );
use Spark::Types qw( :all );
use namespace::autoclean;

has name => (
    isa      => Str,
    is       => 'ro',
    required => 1,
);

sub human_name {
    my ($self) = @_;

    if (is_LabelledObject($self)) {
        return $self->label;
    }
    if (is_NamedObject($self)) {
        return $self->name;
    }
    return q();
}

1;


=pod

=encoding utf-8

=head1 NAME

Spark::Field::Named

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
