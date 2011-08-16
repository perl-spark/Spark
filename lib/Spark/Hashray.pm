package Spark::Hashray;
use strict;
use warnings;

use Carp;
use List::Util 'first';

sub new {
    my ($package,@items) = @_;
    croak "New needs an even number of arguments." if (@values % 2);
    bless [@items],$package;
}

sub push {
    my ($self,@values) = @_; 
    croak "Push needs an even number of arguments." if (@values % 2);
    while (@values) {
        push(@$self,[shift @values,shift @values]);
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
