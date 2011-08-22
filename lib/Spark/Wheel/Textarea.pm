package Spark::Wheel::Textarea;

use Moose;
with 'Spark::Simple::Field';

has '+renderer' => (
    default => sub {
        require Spark::Wheel::Textarea::Renderer::HTML;
        Spark::Wheel::Textarea::Renderer::HTML->new;
      }
);

__PACKAGE__->meta->make_immutable;

1;
__END__
