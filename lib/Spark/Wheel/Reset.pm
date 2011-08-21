package Spark::Wheel::Reset;

use Moose;
use Spark::Wheel::Reset::Renderer::HTML;

with 'Spark::Simple::Field';

# Seriously, has ever anyone had a use for a form reset button?
# "Throw away everything I just typed" is really annoying, 
# especially if it happened to be beside the submit button,
# and you slip and ARRRRGH, NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO0.
#
# Its stuff like that that causes science fiction movies.
has '+renderer' => (
    default => sub { Spark::Wheel::Reset::Renderer::HTML->new; }
);

__PACKAGE__->meta->make_immutable;

1;
__END__
