package Spark::Hashray;
use strict;
use warnings;

use List::Util 'first';

sub new {
    my ($package,@items) = @_;
    bless [@items],$package;
}

sub push {
    my ($self,$k,$v) = @_;
    push @$self, [$k, $v];
}

sub pairwise {
    my ($self,@values) = @_; 
    while (@values) {
        $self->push(shift @values,@values);
    }
}

sub get {
    my ($self,$key) = @_;
    (map {$_->[1]} grep {$key eq $_->[0]} @$self);
}

sub get_one {
    my ($self,$key) = @_;
    ((first {$key eq $_->[0]} @$self) || [])->[1];
}

1;
__END__
