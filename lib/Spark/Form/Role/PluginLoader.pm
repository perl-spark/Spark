use strict;
use warnings;

package Spark::Form::Role::PluginLoader;
{
  $Spark::Form::Role::PluginLoader::VERSION = '0.1.0';
}

# FILENAME: PluginLoader.pm
# CREATED: 07/08/11 01:38:21 by Kent Fredric (kentnl) <kentfredric@gmail.com>
# ABSTRACT: A generalised plugin loading system role applicator



use MooseX::Role::Parameterized;
use MooseX::Types::Perl qw( :all );
use MooseX::Types::Moose qw( :all );
use Spark::Types qw( :all );
use namespace::autoclean;

# Default namespace list to use on this class
parameter namespaces => (
    isa => ArrayRef [PackageName],
    required => 1,
    is       => 'ro',

    #  Presently broken in MXRP 0.26
    #    traits   => ['Array'],
    #    handles  => {
    #        '_namespaces' => 'elements',
    #    },
);

parameter construct_method_name => (
    isa      => Str,
    required => 1,
    is       => 'ro',
);

# specify a attribute name to generate code for
# if you want to enable your users to specify their
# own namespace list that take priority.

parameter user_namespaces_init_arg => (
    isa => Maybe [Str],
    is => 'ro',
    default => sub { undef },
);

role {

    my $p = shift;

    my %plugin_loader_handles;

    $plugin_loader_handles{$p->construct_method_name} = '_construct_plugin';

    has _plugin_loader => (
        isa        => SparkFormPluginLoader,
        is         => 'ro',
        init_arg   => undef,
        lazy_build => 1,
        handles    => {%plugin_loader_handles},
    );

    has _plugin_loader_user_namespaces => (
        isa => ArrayRef [PackageName],
        is => 'ro',
        default => sub { [] },
        traits => ['Array'],
        init_arg => $p->user_namespaces_init_arg,
    );

    method _build__plugin_loader => sub {
        my $self = shift;
        my %config;
        $config{_namespaces}      = $p->namespaces;
        $config{_user_namespaces} = $self->_plugin_loader_user_namespaces;

        require Spark::Form::PluginLoader;

        return Spark::Form::PluginLoader->new(%config);
    };

}
;

1;


__END__
=pod

=encoding utf-8

=head1 NAME

Spark::Form::Role::PluginLoader - A generalised plugin loading system role applicator

=head1 VERSION

version 0.1.0

=head1 SYNOPSIS

  package Foo;

  use Moose;

  with 'Spark::Form::Role::PluginLoader' => {
    namespaces => [ 'FooX::Plugin', 'Foo::Plugin' ],
    construct_method_name => '_construct_plugin',
  };

  .....

  sub foo {
    my $self = shift;
    $self->_construct_plugin('plugin-name', @args_for_new );
  }

or alternatively:

  package Baz;

  use Moose;

  with 'Spark::Form::Role::PluginLoader' => {
    namespaces => [ 'BazX::Plugin', 'Baz::Plugin' ],
    construct_method_name => '_construct_plugin',
    user_namespaces_init_arg => 'namespace_extra',
  };

  .....

  sub bar {
    my $self = shift;
    $self->_construct_plugin('quux', @args_for_new );
  }

  ....

  my $baz = Baz->new( namespace_extra => ['MyProject'] );
  $baz->bar() # will load MyProject::Quux, BazX::Quux or Baz::Quux

=head1 DESCRIPTION

This role is more or less a sugar-syntax applicator for L<Spark::Form::PluginLoader>

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

