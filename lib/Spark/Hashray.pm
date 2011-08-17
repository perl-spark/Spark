package Spark::Hashray;
use strict;
use warnings;

use Carp;
use List::Util 'first';

sub new {
    my ($package,@items) = @_;
    croak "New needs an even number of arguments." if (@items % 2);
    my $ret = bless [],$package;
    $ret->push(@items);
    $ret;
}

sub push {
    my ($self,@items) = @_; 
    croak "Push needs an even number of arguments." if (@items % 2);
    while (@items) {
        push(@$self,[shift @items,shift @items]);
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
