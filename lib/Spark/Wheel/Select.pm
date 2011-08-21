package Spark::Wheel::Select;

use Moose;
use Spark::Wheel::Select::Renderer;
with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::Select::Renderer->new; }
);

__PACKAGE__->meta->make_immutable;

1;
__END__
