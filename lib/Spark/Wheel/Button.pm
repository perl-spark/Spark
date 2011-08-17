package Spark::Wheel::Button;

use Moose;
use Spark::Wheel::Button::Renderer::HTML;
with 'Spark::Simple::Field';

has name => ( is=>'ro');
has '+renderer' => (
    default => sub { Spark::Wheel::Button::Renderer::HTML->new; }
);

1;
__END__
