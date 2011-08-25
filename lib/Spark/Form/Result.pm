use strict;
use warnings;

package Spark::Form::Result;

use Moose;
use MooseX::Types::Moose qw( :all );
use Spark::Types qw( :all );
use namespace::autoclean;

has results => (
    isa => ArrayRef [SparkFormFieldResult],
    is => 'ro',
    default => sub { [] },
    traits  => ['Array'],
    handles => {
        push    => 'push',
        first_r => 'first',
        grep_r  => 'grep',
    },
);

sub bool {
    my ($self) = @_;
    return $self->first_r(sub {
            !$_->bool
    });
}

sub messages {
    my ($self) = @_;
    return $self->grep_r(sub {
            !$_->bool && $_->message
    });
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;
