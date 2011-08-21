package Spark::Wheel::File;

use Moose;
use Spark::Wheel::File::Renderer::HTML;

with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::File::Renderer::HTML->new; }
);

__PACKAGE__->meta->make_immutable;

1;
__END__
