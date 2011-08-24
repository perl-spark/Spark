use strict;
use warnings;

package Spark::Types::Misc;

# FILENAME: Misc.pm
# CREATED: 24/08/11 19:08:53 by Kent Fredric (kentnl) <kentfredric@gmail.com>
# ABSTRACT: Miscellaneous types that wouldn't go anywhere else.

use Spark::Types::Classes qw( :all );
use Spark::Types::Roles qw( :all );
use MooseX::Types::Moose qw( :all );

use MooseX::Types -declare => [qw(
      BalancedList
      NamedObject LabelledObject
      ModPlugObject
      )];

=head1 TYPES

=cut

class_type ModPlugObject, {class => 'Module::Pluggable::Object'};

subtype BalancedList,
  as ArrayRef,
  where { @{$_} % 2 == 0 };

coerce SparkHashray,
  from BalancedList,
  via {
    require Spark::Hashray;
    return Spark::Hashray->new(@{$_});
  };

subtype LabelledObject, as Object, where {
    $_->can('label') and $_->label;
};

subtype NamedObject, as Object, where {
    $_->can('name') and $_->name;
};

1;

