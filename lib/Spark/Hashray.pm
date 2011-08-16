package Spark::Hashray;

use List::Util 'first';

sub new {
    my ($package,@items) = @_;
    bless [@items],$package->new;
}

sub push_pair {
    my ($self,$k,$v) = @_;
    push @$self, [$k, $v];
}

sub pairwise {
    #pmurias just rewrote these things, will leave this until he pushes
}

sub get {
    my ($self,$key) = @_;
    map {$_[1]} grep {$key eq $_[0]} @$self;
}

sub get_one {
    (first {$key eq $_[0]} @$self)[0];
}

1;
__END__
