use strict;
use warnings;

package Spark::Form::PluginLoader;
{
  $Spark::Form::PluginLoader::VERSION = '0.1.0';
}

# FILENAME: PluginLoader.pm
# CREATED: 07/08/11 04:07:57 by Kent Fredric (kentnl) <kentfredric@gmail.com>
# ABSTRACT: A generalised plugin loading system

use Moose;
use MooseX::Types::Perl qw( :all );
use MooseX::Types::Moose qw( :all );
use Spark::Types qw( :all );
use Class::Load qw( load_class );
use namespace::autoclean;

has _namespaces => (
    isa => ArrayRef [PackageName],
    is => 'ro',
    default => sub { [] },
    traits  => ['Array'],
    handles => {
        _all_namespaces => 'elements',
    },
);

has _user_namespaces => (
    isa => ArrayRef [PackageName],
    is => 'ro',
    default => sub { [] },
    traits  => ['Array'],
    handles => {
        _all_user_namespaces => 'elements',
    },
);

has '_plugin_stash' => (
    isa        => ModPlugObject,
    is         => 'ro',
    lazy_build => 1,
    handles    => {
        '_all_plugin_stash' => 'plugins',
    },
);

has '_plugin_constructor' => (
    isa        => CodeRef,
    is         => 'ro',
    lazy_build => 1,
    handles    => {
        '_call_plugin_constructor' => 'execute',
    },
);

sub namespaces {
    my $self = shift;
    return ($self->_all_user_namespaces, $self->_all_namespaces);
}

sub _build__plugin_stash {
    my $self = shift;
    require Module::Pluggable::Object;

    return Module::Pluggable::Object->new(
        search_path => [$self->namespaces],
        required    => 1,
    );
}

sub _build_plugin_constructor {
    my $self = shift;
    return sub {
        my ($modname, @extra) = @_;
        return $modname->new(@extra);
    };
}

sub _normalize_module_name {
    my ($self, $module_name) = @_;

    foreach my $ns ($self->namespaces) {

        # if the module name is detected as being
        # under one of our namespaces,
        # then strip the namespace prefix from it.
        # ie:
        #
        # Spark::Form::Field ->
        #     Field
        #
        # if 'Spark::Form' is one of our namespaces.
        #
        # this seems a bit backwards really, its unexpanding fully qualified
        # plugin names and hoping that it wont later
        # re-expand to some different full qualification.
        last if $module_name =~ s/^${ns}:://;
    }

    # replace remaining :: with -
    #
    #  Foo::Bar::Baz ->  foo-bar-baz
    #  Spark::Form::Baz -> baz
    #
    $module_name =~ s/::/-/g;
    $module_name = lc $module_name;
    return $module_name;
}

sub _construct_plugin {
    my ($self, $type, @extra) = @_;
    my $mod = $self->_load_plugin($type);
    return $self->_call_plugin_constructor($mod, @extra);
}

sub _load_plugin {
    my ($self, $type) = @_;
    my $mod = $self->_find_matching_mod($type) or $self->_error(
        message => "No such module/plugin exists in the plugin-stash/environment matching \"$type\"",
        payload => {
            type => $type,
        },
    );
    load_class($mod);
    return $mod;
}

sub _find_matching_mod {
    my ($self, $wanted) = @_;

    # iterate through all available plugins,
    # and return the first one that when normalized, matches the 'wanted' value.
    foreach my $mod ($self->_all_plugin_stash) {
        return $mod if $self->_normalize_module_name($mod) eq $wanted;
    }

    # Not in the plugins stash.
    return 0;
}

sub _error {
    my ($self, %params) = @_;
    require Carp;
    if ($params{is_warning}) {
        if ($params{verbose}) {
            Carp::cluck($params{message});
        } else {
            Carp::carp($params{message});
        }
    } else {
        if ($params{verbose}) {
            Carp::confess($params{message});
        } else {
            Carp::croak($params{message});
        }
    }
    return;    # Yes, it can return if its just a warning.
}

no Moose;
__PACKAGE__->meta->make_immutable;
1;


__END__
=pod

=encoding utf-8

=head1 NAME

Spark::Form::PluginLoader - A generalised plugin loading system

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

