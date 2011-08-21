package Spark::Wheel::Checkbox;

use Moose;
use Spark::Wheel::Checkbox::Renderer::HTML;

with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::Checkbox::Renderer->new; }
);

__PACKAGE__->meta->make_immutable;
1;
__END__
