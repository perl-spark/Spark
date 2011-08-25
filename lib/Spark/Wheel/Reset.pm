use strict;
use warnings;

package Spark::Wheel::Reset;

use Moose;

with 'Spark::Simple::Field';
use namespace::autoclean;

# Seriously, has ever anyone had a use for a form reset button?
# "Throw away everything I just typed" is really annoying,
# especially if it happened to be beside the submit button,
# and you slip and ARRRRGH, NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO0.
#
# Its stuff like that that causes science fiction movies.
has '+renderer' => (
    default => sub {
        require Spark::Wheel::Reset::Renderer::HTML;

        Spark::Wheel::Reset::Renderer::HTML->new;
      }
);

__PACKAGE__->meta->make_immutable;

1;
__END__
