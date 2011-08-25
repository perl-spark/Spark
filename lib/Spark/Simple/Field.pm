use strict;
use warnings;

package Spark::Simple::Field;

use Moose::Role;
use namespace::autoclean;
with 'Spark::Field', 'Spark::Simple::Node', 'Spark::Renders', 'Spark::Named', 'Spark::Labelled';

1;
__END__


