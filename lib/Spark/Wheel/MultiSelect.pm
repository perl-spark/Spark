package Spark::Wheel::MultiSelect;

use Moose;
use Spark::Wheel::MultiSelect::Renderer::HTML;

with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::MultiSelect::Renderer->new; }
);

__PACKAGE__->meta->make_immutable;

1;
__END__
