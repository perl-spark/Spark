package Spark::Wheel::Text;

use Moose;
use Spark::Wheel::Text::Renderer::HTML;
with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::Text::Renderer::HTML->new; }
);

__PACKAGE__->meta->make_immutable;

1;
__END__
