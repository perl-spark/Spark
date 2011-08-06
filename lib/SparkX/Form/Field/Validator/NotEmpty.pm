use strict;

package SparkX::Form::Field::Validator::NotEmpty;

# ABSTRACT: Validates a field has some value

use Moose;
with 'Spark::Form::Field::Validator';

has errmsg_empty => (
    isa      => 'Str',
    is       => 'rw',
    required => 0,
    default  => sub {
        my $self = shift;
        return $self->human_name .
          ' must be provided.'
    },
);

sub _not_empty {
    my ($self) = @_;

    unless ($self->value) {
        $self->error($self->errmsg_empty);
    }
    return $self;
}

sub validate { return shift->_not_empty };

__PACKAGE__->meta->make_immutable;

1;
__END__

=head1 DESCRIPTION

A not empty enforcement mix-in. Adds one field plus action.
Makes sure that C<value> is not empty.

=head1 ACCESSORS

=head2 errmsg_empty => Str

Error message to be shown to the user if C<value> is empty.

=cut
