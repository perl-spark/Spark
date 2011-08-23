package Spark::Result::Item;

use Moose;

# I don't think these will ever go circular-ref-y, but weak_ref => 1 is the fix -- jjl

has field => (
    isa => 'Maybe[Spark::Field]',
    is => 'ro',
    default => undef,
);

has validator => (
    isa => 'Maybe[Spark::Validator]',
    is => 'ro',
    default => undef,
);

has message => (
    isa => 'Str',
    is => 'ro',
    default => '',
);

# Do not want to add this, holding off for now
#has code => (
#    isa => 'Str',
#    is => 'ro',
#);

__PACKAGE__->meta->make_immutable;
1;
__END__
