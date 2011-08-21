package Spark::Wheel::RadioGroup;

use Moose;
use Spark::Wheel::RadioGroup::Renderer::HTML;

with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub { Spark::Wheel::RadioGroup::Renderer::HTML->new; }
);

__PACKAGE__->meta->make_immutable;

1;
__END__
