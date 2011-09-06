use strict;
use warnings;

package Spark::Form::Field::Validator;
{
  $Spark::Form::Field::Validator::VERSION = '0.1.0';
}

use Moose::Role;
use Spark::Types qw( :all );
use namespace::autoclean;

requires 'validate';

has field => (
    isa      => SparkFormField,
    is       => 'rw',
    required => 1,
    weak_ref => 1,
);

# __PACKAGE__->meta->make_immutable;
1;


=pod

=encoding utf-8

=head1 NAME

Spark::Form::Field::Validator

=head1 VERSION

version 0.1.0

=head1 SYNOPSIS

 package MyApp::Validator::Numeric;
 use Moose;
 with 'Spark::Form::Field::Validator';

 sub validate {
   my $self = shift;
   unless ($self->field =~ /^[0-9]+$/) {
     $self->field->error("$self->field->human_name is not numeric");
   }
 }

=head1 NAME

Spark::Form::Field::Validator - Base role for field validator objects

=head1 COPYRIGHT

Copyright 2011 James Laver

=head1 LICENCE

Licensed under the same terms as Perl itself.

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

