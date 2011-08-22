package Spark::Types;

use MooseX::Types
  -declare => [qw(
      SparkData
      SparkForm
      SparkField
      SparkNode
      SparkObject
      SparkRenderer
      SparkValidates
      SparkValidator
      SparkContainer
      Hashray
      BalancedList
      )];

use MooseX::Types::Moose qw(ArrayRef);

role_type SparkData,       {role  => 'Spark::Data'};
role_type SparkForm,       {role  => 'Spark::Form'};
role_type SparkField,      {role  => 'Spark::Field'};
role_type SparkNode,       {role  => 'Spark::Node'};
role_type SparkObject,     {role  => 'Spark::Object'};
role_type SparkRenderer,   {role  => 'Spark::Renderer'};
role_type SparkValidates,  {role  => 'Spark::Validates'};
role_type SparkValidator,  {role  => 'Spark::Validator'};
class_type SparkContainer, {class => 'Spark::Container'};
class_type Hashray,        {class => 'Spark::Hashray'};

subtype BalancedList,
  as ArrayRef,
  where { @{$_} % 2 == 0 };

coerce Hashray,
  from BalancedList,
  via {
    require Spark::Hashray;
    Spark::Hashray->new(@{$_})
  };

1;
__END__
