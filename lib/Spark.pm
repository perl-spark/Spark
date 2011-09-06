use strict;
use warnings;

package Spark;
{
  $Spark::VERSION = '0.1.0';
}

# FILENAME: Spark.pm
# CREATED: 22/08/11 15:22:22 by Kent Fredric (kentnl) <kentfredric@gmail.com>
# ABSTRACT: A simple yet powerful forms validation system that promotes reuse.

use Moose;
use namespace::autoclean;


no Moose;
__PACKAGE__->meta->make_immutable;
1;


__END__
=pod

=encoding utf-8

=head1 NAME

Spark - A simple yet powerful forms validation system that promotes reuse.

=head1 VERSION

version 0.1.0

=head1 DESCRIPTION

At this time, most of the documentation for this module is in L<Spark::Form>,
and this module ( L<Spark> ) is merely a placeholder.

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

