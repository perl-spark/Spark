use strict;
use warnings;

package Spark::Form::Validator;
{
  $Spark::Form::Validator::VERSION = '0.1.0';
}

use Moose;
use Spark::Types qw( :all );
use namespace::autoclean;

has form => (
    isa      => SparkForm,
    is       => 'rw',
    required => 1,
    weak_ref => 1,
);

sub validate {
    require Carp;
    Carp::carp('Spark::Form::Validator must be subclassed, not used directly');
    return;
}

__PACKAGE__->meta->make_immutable;
1;


=pod

=encoding utf-8

=head1 NAME

Spark::Form::Validator

=head1 VERSION

version 0.1.0

=head1 NAME

Spark::Form::Validator - Base class for form validator objects

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

