package Spark::Field::Named;

use Moose::Role;
use MooseX::Types::Moose qw( :all );
use Spark::Types qw( :all );
use namespace::autoclean;

has name => (
    isa      => Str,
    is       => 'ro',
    required => 1,
);

sub human_name {
    my ($self) = @_;

    if (is_LabelledObject($self)) {
        return $self->label;
    }
    if (is_NamedObject($self)) {
        return $self->name;
    }
    return q();
}

1;
__END__
