use strict;

package Spark::Form::Source;
{
  $Spark::Form::Source::VERSION = '0.1.0';
}

# ABSTRACT: Base class for population plugins

use Moose::Role;
use namespace::autoclean;
requires 'populate';

1;


=pod

=encoding utf-8

=head1 NAME

Spark::Form::Source - Base class for population plugins

=head1 VERSION

version 0.1.0

=head1 SEE ALSO

=over 4

=item L<Spark::Form> - What you were probably after

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

