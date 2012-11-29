use strict;
use warnings;

package Spark::List;

## class # hack for autogenerator will be required when we eliminate moose

# this is a placeholder. there will be an optimised version along at some point that doesn't use moose.

use Moose;
use MooseX::Types::Moose qw(ArrayRef);
use namespace::autoclean;

has items => (
    isa     => ArrayRef,
    traits  => ['Array'],
    handles => {
        push     => 'push',
        elements => 'elements',
        grep     => 'grep',
        get      => 'get',
    },
);

sub tree_grep {
    my ($self, $subref) = @_;

    for my $i ($list->elements) {
        if ($subref->($i)) {
            return ($i, $self)
        }
    }
    for my $i ($list->elements) {
        if ($i->meta->does('Spark::Role::Container')) {

        }
    }
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;

__END__
