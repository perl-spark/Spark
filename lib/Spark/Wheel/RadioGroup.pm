package Spark::Wheel::RadioGroup;

use Moose;
use Spark::Wheel::RadioGroup::Renderer;

with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::RadioGroup::Renderer->new; }
);

__PACKAGE__->meta->make_immutable;

1;
__END__
