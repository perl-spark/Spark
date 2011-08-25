use strict;
use warnings;

package Spark::Container;

use Moose::Role;
use Spark::Types qw(SparkHashray);
use namespace::autoclean;

=attr children

  my $hash = $object->children();

=cut

has children => (
    isa     => SparkHashray,
    is      => 'ro',
    handles => {
    },
);

1;
__END__

