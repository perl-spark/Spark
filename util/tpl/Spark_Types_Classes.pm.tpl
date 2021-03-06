use strict;
use warnings;

package Spark::Types::Classes;

# ABSTRACT: MooseX::Types for all Spark Classes

# NOTE: This file is generated from the template Spark_Types_Classes.pm.tpl
# DO NOT EDIT THIS FILE.
# Last generated at [% timestamp %]

use MooseX::Types -declare => [qw([% FOREACH class IN classes %]
      [% class.short -%]
[% END %]
      )];
use namespace::autoclean;

=head1 TYPES


[% FOREACH class IN classes %]
=head2 [% class.short %]

  isa => '[% class.long %]'

=cut

class_type [% class.short %], {
    class   => '[% class.long %]',
    message => sub {
        return qq{$_ is not of class "[% class.long %]"};
    },
};
[% END %]
1;
__END__
