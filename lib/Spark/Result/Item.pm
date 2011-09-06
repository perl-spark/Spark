use strict;
use warnings;

package Spark::Result::Item;
{
  $Spark::Result::Item::VERSION = '0.1.0';
}

use Moose;
use MooseX::Types::Moose qw( :all );
use Spark::Types qw( :all );
use namespace::autoclean;

# I don't think these will ever go circular-ref-y, but weak_ref => 1 is the fix -- jjl

has field => (
    isa => Maybe [SparkField],
    is => 'ro',
    default => undef,
);

has validator => (
    isa => Maybe [SparkValidator],
    is => 'ro',
    default => undef,
);

has message => (
    isa     => Str,
    is      => 'ro',
    default => q{},
);

# Do not want to add this, holding off for now
#has code => (
#    isa => Str,
#    is => 'ro',
#);

__PACKAGE__->meta->make_immutable;
1;


=pod

=encoding utf-8

=head1 NAME

Spark::Result::Item

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
