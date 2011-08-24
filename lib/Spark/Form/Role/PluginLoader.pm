use strict;
use warnings;

package Spark::Form::Role::PluginLoader;

# FILENAME: PluginLoader.pm
# CREATED: 07/08/11 01:38:21 by Kent Fredric (kentnl) <kentfredric@gmail.com>
# ABSTRACT: A generalised plugin loading system role applicator

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

=cut

=head1 DESCRIPTION

This role is more or less a sugar-syntax applicator for L<Spark::Form::PluginLoader>

=cut

use MooseX::Role::Parameterized;
use MooseX::Types::Perl qw( :all );
use MooseX::Types::Moose qw( :all );
use Spark::Form::Types qw( :all );

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
        isa        => SPluginLoader,
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

