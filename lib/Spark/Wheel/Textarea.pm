package Spark::Wheel::Textarea;
use Spark::Wheel::Textarea::Renderer::HTML;
use Moose;
with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::Textarea::Renderer::HTML->new; }
);

1;
__END__
