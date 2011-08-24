package Spark::Form::Field::Result;

use Moose;
use MooseX::Types::Moose qw( :all );
use Spark::Form::Types qw( :all );
use namespace::autoclean;

has _results => (
    isa => ArrayRef [SFieldValidatorResult],
    is => 'ro',
    default => sub { [] },
    traits  => ['Array'],
    handles => {
        results => 'elements',
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
