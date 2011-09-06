use strict;
use warnings;

package Spark::Simple::Node;
{
  $Spark::Simple::Node::VERSION = '0.1.0';
}

use Moose::Role;
use namespace::autoclean;
with 'Spark::Node', 'Spark::Validates';

use Spark::Types qw(:all);

sub validate {
    my ($self, $data) = @_;
    require Spark::Result;
    my $result = Spark::Result->new;
    if ($self->can('_validate')) {
        my @ret = $self->_validate($data);
        $result->push(form_result(@ret));
    }
    foreach my $f (@{$self->children}) {
        if (is_SparkValidates($f)) {
            my $ret = $f->validate($self, $data);
            $result->push($ret);
        }
    }
    foreach my $v (@{$self->validators}) {
        my @ret = $v->validate($self, $data);
        $result->push(form_result(@ret));
    }

    return $result;
}

1;


=pod

=encoding utf-8

=head1 NAME

Spark::Simple::Node

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
