use strict;
use warnings;

package Spark::Simple::Field;

use Moose::Role;
use namespace::autoclean;
with 'Spark::Field', 'Spark::Simple::Node', 'Spark::Block::Renders', 'Spark::Block::Named', 'Spark::Block::Labelled';

1;
__END__


