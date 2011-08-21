package Spark::Wheel::File;

use Moose;
use Spark::Wheel::File::Renderer;

with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::File::Renderer->new; }
);

__PACKAGE__->meta->make_immutable;

1;
__END__
