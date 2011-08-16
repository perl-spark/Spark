package Spark::Types;

use MooseX::Types
  -declare => [qw(
    SparkForm
    SparkField
    SparkNode
    SparkObject
    SparkValidates
    SparkValidator
    SparkContainer
    Hashray
    BalancedList
  )];

use MooseX::Types::Moose qw(ArrayRef);

use Spark::Couplet;

role_type SparkForm, { does => 'Spark::Form' };

role_type SparkField, { does => 'Spark::Field' };

role_type SparkNode, { does => 'Spark::Node' };

role_type SparkObject, { does => 'Spark::Object' };

role_type SparkValidates, { does => 'Spark::Validates' };

role_type SparkValidator, { does => 'Spark::Validator' };

class_type SparkContainer, {class => 'Spark::Container'};

subtype BalancedList,
    as ArrayRef,
    where {@$_ % 2 == 0};

class_type Hashray, {class => 'Spark::Hashray'};
coerce Hashray,
    from BalancedList,
    via { Hashray->new(@$_); };

1;
__END__
