#!perl

package t;
use strict;
use warnings;

use Test::More;
use Test::Fatal;
use FindBin;

use lib "$FindBin::Bin/../../t/lib";

use Spark::Load;

{

    package t::TestCase;
    use Moo;
    has module_prefix  => (is => rwp => required => 1);
    has module_suffix  => (is => rwp => required => 1);
    has construct_name => (is => rwp => required => 1);
    has add_namespaces => (is => rwp => required => 1);
    has loader => (is => rwp => lazy => 1, default => sub {
            my ($self) = @_;
            my $i = Spark::Load->new();
            for my $ns (@{$self->add_namespaces}) {
                $i->add_namespace($ns);
            }
            return $i;
    });

    sub module_name { return $_[0]->module_prefix . q{::} . $_[0]->module_suffix }

    sub self_test {
        my $self = shift;
        t::subtest $self->construct_name, sub {
            t::is(
                $self->loader->expand_plugin_name($self->module_suffix),
                $self->module_name,
                "Loaded the correct " . $self->construct_name
            );
            t::isa_ok(
                $self->loader->create_plugin($self->module_suffix, name => $self->construct_name),
                $self->module_name,
                "Created the correct " . $self->construct_name
            );
            t::is(
                $self->loader->create_plugin($self->module_suffix, name => $self->construct_name)->name,
                $self->construct_name,
                "Object for " . $self->construct_name . " has the right name"
            );
        };
    }

    sub fail_test {
        my $self = shift;
        t::subtest($self->construct_name, sub {
                t::isnt(t::exception { $self->loader->make($self->module_suffix) }, undef, 'Failed to load nonexistent module');
        });
    }

}

t::TestCase->new(
    module_prefix  => 'Spark::Wheel',
    module_suffix  => '0beec7b5ea3f0fdbc95d0dd47f3c5bc275da8a33',
    construct_name => 'foo',
    add_namespaces => [],
)->self_test();

t::TestCase->new(
    module_prefix  => 'Test::Spark::Load::Field',
    module_suffix  => '62cdb7020ff920e5aa642c3d4066950dd1f01f4d',
    construct_name => 'bar',
    add_namespaces => ['Test::Spark::Load::Field'],
)->self_test();

t::TestCase->new(
    module_prefix  => 'Test::Spark::Field',
    module_suffix  => 'bbe960a25ea311d21d40669e93df2003ba9b90a2',
    construct_name => 'baz',
    add_namespaces => ['Test::Spark::Load::Field', 'Test::Spark::Field'],
)->self_test();

t::TestCase->new(
    module_prefix  => 'Bogus::Infantry',
    module_suffix  => 'ae2ad9454f3af7fcb18c83969f99b20a788eddd1',
    construct_name => 'quux',
    add_namespaces => ['Test::Spark::Load::Field', 'Test::Spark::Field'],
)->fail_test();

done_testing();

