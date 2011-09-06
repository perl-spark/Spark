use strict;
use warnings;

package Spark::Form::Field::Role::NewValidator;
{
  $Spark::Form::Field::Role::NewValidator::VERSION = '0.1.0';
}

use Moose::Role;
use Spark::Types ':all';
use MooseX::Types::Moose ':all';
use namespace::autoclean;

requires '_validate';

has _validators => (
    isa => ArrayRef [SparkFormFieldValidator],
    is => 'rw',
    init_arg => undef,
    default  => sub { [] },
    traits   => ['Array'],
    handles  => {
        validators => 'elements',
    },
);

after _validate => sub {
    my ($self) = @_;
    $_->validate for $self->validators;
};

1;


=pod

=encoding utf-8

=head1 NAME

Spark::Form::Field::Role::NewValidator

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
