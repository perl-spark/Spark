use strict;
use warnings;

package Spark::Validator::Regex;

use Moose;
use MooseX::Types::Moose qw(:all);
use namespace::autoclean;
with 'Spark::Validator';

has regex => (
    isa      => RegexpRef,
    is       => 'rw',
    required => 1,
);

has negate => (
    isa     => Bool,
    is      => 'rw',
    default => 0,
);

has against => (
    isa     => ArrayRef,
    is      => 'rw',
    default => sub { [] },
);

has message => (
    isa     => 'Str',
    is      => 'rw',
    lazy    => 1,                      # So you can pass a sub in and get it lazily evaluated
    default => 'Regex match failed',
);

sub validate {
    my ($self, $context) = @_;
    my @against = self->get_against($self->against, $context->node->listens);
    @against = $context->node->listens unless @against;
    foreach (@against) {
        my $result = $context->node_data =~ $self->regex;
        $result = !$result if $self->negate;
        if (!$result) {
            return $self->message;
        }
    }
    return;
}

__PACKAGE__->meta->make_immutable;

1;
