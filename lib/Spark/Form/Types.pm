use strict;
use warnings;

package Spark::Form::Types;
BEGIN {
  $Spark::Form::Types::VERSION = '0.2103'; # TRIAL
}

# ABSTRACT: Utility Type-Library for Spark::Form

use MooseX::Types::Moose qw(:all);
use MooseX::Types -declare => [
  qw(
    PluginNamespaceList
    SparkFormField
    SparkForm
    LabelledObject
    NamedObject
    )
];

subtype PluginNamespaceList, as ArrayRef [Str];

coerce PluginNamespaceList, from Str, via { [$_] };

coerce PluginNamespaceList, from Undef, via { [] };

class_type SparkFormField, { class => 'Spark::Form::Field' };

class_type SparkForm, { class => 'Spark::Form' };

subtype LabelledObject, as Object, where {
  $_->can('label') and $_->label;
};

subtype NamedObject, as Object, where {
  $_->can('name') and $_->name;
};

1;


__END__
=pod

=head1 NAME

Spark::Form::Types - Utility Type-Library for Spark::Form

=head1 VERSION

version 0.2103

=head1 AUTHOR

James Laver L<http://jameslaver.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by James Laver C<< <sprintf qw(%s@%s.%s cpan jameslaver com)> >>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

