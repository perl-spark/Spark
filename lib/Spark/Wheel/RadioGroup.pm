package Spark::Wheel::RadioGroup;

use Moose;

with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub {
        require Spark::Wheel::RadioGroup::Renderer::HTML;
        Spark::Wheel::RadioGroup::Renderer::HTML->new;
      }
);

__PACKAGE__->meta->make_immutable;

1;
__END__
