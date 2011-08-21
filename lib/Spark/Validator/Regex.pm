package Spark::Validator::Regex;

use Moose;
with 'Spark::Validator';

has regex => (
    isa => 'Regexp',
    is => 'rw',
    required => 1,
);

has negate => (
    isa => 'Bool',
    is => 'rw',
    default => 0,
);

has against => (
    isa => 'ArrayRef',
    is => 'rw',
    default => sub { [] },
);

sub validate {
    my ($self,$context) = @_;
    my @against = self->get_against($self->against, $context->node->listens);
    @against = $context->node->listens unless @against;
    foreach (my @against) {
        my $result = $context->node_data =~ $self->regex;
        $result = !$result if $self->negate;
        if ( !$result ) {
          return undef;
        }
    }
    return 1;
}
