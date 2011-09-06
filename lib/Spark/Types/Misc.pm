use strict;
use warnings;

package Spark::Types::Misc;
{
  $Spark::Types::Misc::VERSION = '0.1.0';
}

# FILENAME: Misc.pm
# CREATED: 24/08/11 19:08:53 by Kent Fredric (kentnl) <kentfredric@gmail.com>
# ABSTRACT: Miscellaneous types that wouldn't go anywhere else.

use Spark::Types::Classes qw( :all );
use Spark::Types::Roles qw( :all );
use MooseX::Types::Moose qw( :all );
use namespace::autoclean;
use MooseX::Types -declare => [qw(
      BalancedList
      NamedObject LabelledObject
      ModPlugObject
      )];


class_type ModPlugObject, {class => 'Module::Pluggable::Object'};

subtype BalancedList,
  as ArrayRef,
  where { @{$_} % 2 == 0 };

coerce SparkHashray,
  from BalancedList,
  via {
    require Spark::Hashray;
    return Spark::Hashray->new(@{$_});
  };

subtype LabelledObject, as Object, where {
    $_->can('label') and $_->label;
};

subtype NamedObject, as Object, where {
    $_->can('name') and $_->name;
};

1;


__END__
=pod

=encoding utf-8

=head1 NAME

Spark::Types::Misc - Miscellaneous types that wouldn't go anywhere else.

=head1 VERSION

version 0.1.0

=head1 TYPES

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

