package Spark::Wheel::Image;

use Moose;
use Spark::Wheel::Image::Renderer::HTML;

with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::Image::Renderer::HTML->new; }
);

__PACKAGE__->meta->make_immutable;

1;
__END__
