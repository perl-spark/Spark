use strict;
use warnings;

package Spark::Form::Role::Validity;
BEGIN {
  $Spark::Form::Role::Validity::VERSION = '0.2103'; # TRIAL
}

# ABSTRACT: Common Code for determining the validity of a thing.

use Moose::Role;
use MooseX::Types::Moose qw( :all );
use namespace::autoclean;

has valid => (
  isa      => Bool,
  is       => 'rw',
  required => 0,
  default  => 0,
);

1;


__END__
=pod

=head1 NAME

Spark::Form::Role::Validity - Common Code for determining the validity of a thing.

=head1 VERSION

version 0.2103

=head1 AUTHOR

James Laver L<http://jameslaver.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by James Laver C<< <sprintf qw(%s@%s.%s cpan jameslaver com)> >>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

