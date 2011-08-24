package Spark::Result;

use Moose;
use MooseX::Types::Moose qw( :all );
use Spark::Form::Types qw( :all );
use namespace::autoclean;

has items => (
    isa => ArrayRef [SparkResultItem],
    is => 'ro',
    traits  => ['Array'],
    default => sub { [] },
    handles => {
        _push_item => 'push',
    },
);

sub _make_item {
    my ($self, %kw) = @_;
    require Spark::Result::Item;
    return Spark::Result::Item->new(%kw);
}

sub error {
    my ($self, $error, %kw) = @_;
    return $self->_push_item(
        $self->_make_item(
            error     => $error,
            field     => $kw{field},
            validator => $kw{validator}
          )
    );
}

__PACKAGE__->meta->make_immutable;
1;
__END__
