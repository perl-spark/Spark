use strict;
use warnings;

package Spark::Load;

# ABSTRACT: Module Loader for Spark

=head1 DESCRIPTION

	my $loader = Spark::Load->new();

	[ $loader->default_namespaces ] # [ 'Spark::Wheel' ]

	[ $loader->user_namespaces ] # []

	$loader->add_namespace('MyProject::Form');

	[ $loader->user_namespaces ] # ['MyProject::Form']

	[ $loader->namespaces ] # [ 'MyProject::Form', 'Spark::Wheel' ]

	my $instance = $loader->create_plugin( 'TextArea' => { ... });


=cut

use Carp qw();
use Module::Runtime qw();
use Moose;
use MooseX::Types::Perl qw(:all);
use MooseX::Types::Moose qw(:all);
use namespace::autoclean;

has _default_namespaces => (
    isa => ArrayRef [PackageName],
    is => 'ro',
    default => sub { ['Spark::Wheel'] },
    traits  => ['Array'],
    handles => {
        default_namespaces => 'elements',
    },
);

has _user_namespaces => (
    isa => ArrayRef [PackageName],
    is => 'ro',
    required => 1,
    default  => sub { [] },
    traits   => ['Array'],
    handles  => {
        add_namespace   => 'push',
        user_namespaces => 'elements',
    },
);

=method namespaces

Returns a list of package namespaces in search order.

=cut

sub namespaces {
    my ($self) = @_;
    my (@namespaces) = ( $self->default_namespaces, $self->user_namespaces, );
    return reverse @namespaces;
}

=method expand_plugin_name

	my $module = $loader->expand_plugin_name( 'Foo' );

Walks L</namespaces> until it finds a loadable package at ${namespace}::Foo
or even just "Foo", and returns the name of the item it found.

If C<$plugin_name> cannot be resolved, a fatal error occurs.

=cut

sub expand_plugin_name {
    my ( $self, $plugin_name ) = @_;
    my (@tried);
    for my $namespace ( $self->namespaces ) {
        my $module_name =
          Module::Runtime::compose_module_name( $namespace, $plugin_name );
        if ( eval { Module::Runtime::require_module($module_name) } ) {
            return $module_name;
        }
        push @tried, $module_name;
    }
    if ( eval { Module::Runtime::require_module($plugin_name) } ) {
        return $plugin_name;
    }
    push @tried, $plugin_name;
    Carp::croak(
"No such module/plugin exists in the plugin-stash/environment matching \"$plugin_name\", \n"
          . " tried : @tried \n",
        " INC : @INC \n"
    );
}

=method create_plugin

	my $instance = $loader->create_plugin( Foo => @args );

The above is equivalent to

	require Some::Namespace::Foo;
	$instance = Some::Namespace::Foo->new( @args );


=cut

sub create_plugin {
    my ( $self, $plugin_name, @options ) = @_;
    my $module_name = $self->expand_plugin_name($plugin_name);
    return $module_name->new(@options) if $module_name;
    return;
}

no Moose;
__PACKAGE__->meta->make_immutable;
1;
__END__
