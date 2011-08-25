use strict;
use warnings;

package Spark::Simple::Field;

use Moose::Role;
with 'Spark::Field', 'Spark::Simple::Node', 'Spark::Renders', 'Spark::Named', 'Spark::Labelled';

1;
__END__


