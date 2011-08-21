package Spark::Wheel::Password;

use Moose;
use Spark::Wheel::Password::Renderer::HTML;

with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::Password::Renderer::HTML->new; }
);

__PACKAGE__->meta->make_immutable;

1;
__END__
