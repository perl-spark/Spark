use strict;
use warnings;

package Spark::Block::Container;

use Moose::Role;
use Spark::Types qw(SparkList);
use namespace::autoclean;

=attr children

  my $hash = $object->children();

=cut

has children => (
    isa     => SparkList,
    handles => {
        _add_child => 'push',
    },
);

1;
__END__
