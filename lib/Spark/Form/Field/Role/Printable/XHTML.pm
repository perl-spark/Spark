use strict;

package Spark::Form::Field::Role::Printable::XHTML;
{
  $Spark::Form::Field::Role::Printable::XHTML::VERSION = '0.1.0';
}

# ABSTRACT: a XHTML1-printable form field role

use Moose::Role;
with 'Spark::Form::Field::Role::Printable';
use namespace::autoclean;

requires 'to_xhtml';

1;


=pod

=encoding utf-8

=head1 NAME

Spark::Form::Field::Role::Printable::XHTML - a XHTML1-printable form field role

=head1 VERSION

version 0.1.0

=head1 SYNOPSIS

 package MyApp::Form::Field::CustomText;
 use Moose;
 extends 'Spark::Form::Field';
 with 'Spark::Form::Field::Role::Printable::XHTML';
 use HTML::Tiny;

 sub to_xhtml {
     my ($self) = @_;
     my $html = HTML::Tiny->new( mode => 'xml' );
     $html->input({type => 'text', value => $self->value});
 }

=head1 METHODS

=head2 to_xhtml :: Undef => Str

This function should return a XHTML string representing your control

=head1 SEE ALSO

=over 4

=item L<Spark::Form::Field>

=back

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

