use strict;

package Spark::Form::Field::Role::Printable;
{
  $Spark::Form::Field::Role::Printable::VERSION = '0.1.0';
}

# ABSTRACT: Printability for form fields

use Moose::Role;
use MooseX::Types::Moose qw( :all );
use namespace::autoclean;

has label => (
    isa      => Str,
    is       => 'rw',
    required => 0,
);

1;


=pod

=encoding utf-8

=head1 NAME

Spark::Form::Field::Role::Printable - Printability for form fields

=head1 VERSION

version 0.1.0

=head1 SYNOPSIS

 package MyApp::Field::CustomText;
 use Moose;
 extends 'Spark::Form::Field';
 with 'Spark::Form::Field::Role::Printable';

 sub to_string {
     my $self = shift;
     sprintf("%s: %s",$self->label, $self->value);
 }

=head1 DESCRIPTION

A fairly free-form module, this is mostly used for checking that it's printable at all.
You probably want one of the roles under this hierarchy, but not just this one.

=head1 VARS

=head2 label :: Str [Optional]

A label that will be printed next to said field in the printed out version

=head1 SEE ALSO

=over 4

=item L<Spark::Form::Field::Printable::HTML> - Role for being printable under HTML4

=item L<Spark::Form::Field::Printable::XHTML> - Role for being printable under XHTML1

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

