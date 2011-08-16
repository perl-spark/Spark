package Spark::Wheel::MultiSelect.pm;

use Moose;
extends 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::MultiSelect::Renderer->new; }
);

1;
__END__
