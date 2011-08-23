package Spark::Result;

use Spark::Result::Item;
use Moose;

has items => (
    isa => 'ArrayRef[Spark::Result::Item]',
    is => 'ro',
    traits => ['Array'],
    default => sub { [] },
    handles => {
        _push_item => 'push',
    },
);

sub _make_item {
    my ($self, %kw) = @_;
    Spark::Result::Item->new(%kw);
}

sub error {
    my ($self, $error, %kw) = @_;
    $self->_push_item(
        $self->_make_item(
            error => $error,
            field => $kw{field},
            validator => $kw{validator}
        )
    );
}
    
__PACKAGE__->meta->make_immutable;
1;
__END__
