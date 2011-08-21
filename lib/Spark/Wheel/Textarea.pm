package Spark::Wheel::Textarea;

use Moose;
use Spark::Wheel::Textarea::Renderer::HTML;

with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::Textarea::Renderer::HTML->new; }
);

__PACKAGE__->meta->make_immutable;

1;
__END__
