use strict;

package Spark::Form::Role::ErrorStore;
{
  $Spark::Form::Role::ErrorStore::VERSION = '0.1.0';
}

# ABSTRACT: A mix-in for adding an internal error storage mechanism.

use Moose::Role 0.90;
use MooseX::Types::Moose qw( :all );
use namespace::autoclean;

requires 'valid';


has _errors => (
    isa => ArrayRef [Str],
    is => 'ro',
    required => 0,
    default  => sub { [] },
    traits   => [qw( Array )],
    handles  => {
        '_add_error'    => 'push',
        'errors'        => 'elements',
        '_clear_errors' => 'clear',
    },
);


sub error {
    my ($self, $error) = @_;

    $self->valid(0);
    $self->_add_error($error);

    return $self;
}

1;


__END__
=pod

=encoding utf-8

=head1 NAME

Spark::Form::Role::ErrorStore - A mix-in for adding an internal error storage mechanism.

=head1 VERSION

version 0.1.0

=head2 errors()  : Array[Str]

Returns a list of all errors encountered so far

=head2 error ( Str )

Adds an error to the current field's list.

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

