use strict;
use warnings;

package Spark::Load;
{
  $Spark::Load::VERSION = '0.1.0';
}

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

sub namespaces {
    my ($self)       = @_;
    my (@namespaces) = (
        $self->default_namespaces,
        $self->user_namespaces,
    );
    return reverse @namespaces;
}

sub _make_mpo {
    my ($self) = @_;
    require Module::Pluggable::Object;
    return Module::Pluggable::Object->new(
        search_path => [$self->namespaces],
        required    => 1,
    );
}

sub package {
    my ($self, $partial) = @_;
    return $self->_load_package($partial);
}

sub make {
    my ($self, $class, @options) = @_;
    my $p = $self->package($class);
    return $p->new(@options) if $p;
    return;
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

sub _load_package {
    my ($self, $type) = @_;
    my $mod = $self->_find_matching_mod($type)
      or do {
        require Carp;
        Carp::croak("No such module/plugin exists in the plugin-stash/environment matching \"$type\"");
      };
    require Class::Load;
    Class::Load::load_class(q{} . $mod);
    return $mod;
}

sub _find_matching_mod {
    my ($self, $wanted) = @_;

    # iterate through all available plugins,
    # and return the first one that when normalized, matches the 'wanted' value.
    foreach my $mod ($self->_make_mpo->plugins) {

        #        print "Done: " . $self->_normalize_module_name($mod). "\n";
        return $mod if $self->_normalize_module_name($mod) eq $wanted;
    }

    # None present
    return 0;
}

no Moose;
__PACKAGE__->meta->make_immutable;
1;


=pod

=encoding utf-8

=head1 NAME

Spark::Load

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
