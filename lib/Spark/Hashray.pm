package Spark::Hashray;
{
  $Spark::Hashray::VERSION = '0.1.0';
}
use strict;
use warnings;

## class # hack for autogenerator

use Carp;
use List::Util 'first';
use namespace::autoclean;

sub new {
    my ($package, @items) = @_;
    croak('New needs an even number of arguments.') if (@items % 2);
    my $ret = bless [], $package;
    $ret->push(@items);
    return $ret;
}

sub push {
    my ($self, @items) = @_;
    croak('Push needs an even number of arguments.') if (@items % 2);
    while (@items) {
        push @{$self}, [shift @items, shift @items];
    }
    return $self;
}

sub get {
    my ($self, $key) = @_;
    return (map { $_->[1] } grep { $key eq $_->[0] } @{$self});
}

sub get_one {
    my ($self, $key) = @_;
    return (((first { $key eq $_->[0] } @{$self}) || [])->[1]);
}

1;


=pod

=encoding utf-8

=head1 NAME

Spark::Hashray

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
