use strict;
use warnings;

package Spark::Types;
{
  $Spark::Types::VERSION = '0.1.0';
}

use parent 'MooseX::Types::Combine';
use namespace::autoclean;
use List::Util qw( first );

# This exists because :all is not supported yet at MX-Types 0.29.
# Patch sent to upstream as topic/support_all

sub import {
    my ($class, @types) = @_;
    my $caller = caller;

    my %types = $class->_provided_types;

    if (first { $_ eq ':all' } @types) {
        $_->import({-into => $caller}, q{:all}) for $class->provide_types_from;
        return;
    }

    my %from;
    for my $type (@types) {
        unless ($types{$type}) {
            my @type_libs = $class->provide_types_from;

            die
              "$caller asked for a type ($type) which is not found in any of the"
              . " type libraries (@type_libs) combined by $class\n";
        }

        push @{$from{$types{$type}}}, $type;
    }

    $_->import({-into => $caller}, @{$from{$_}})
      for keys %from;
    return 1;
}

__PACKAGE__->provide_types_from(qw(
      Spark::Types::Classes
      Spark::Types::Roles
      Spark::Types::Misc
      ));

1;


=pod

=encoding utf-8

=head1 NAME

Spark::Types

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
