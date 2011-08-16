package Spark::Types;

use MooseX::Types
  -declare => [qw(
    SparkForm
    SparkField
    SparkNode
    SparkObject
    SparkValidator
    SparkContainer
    Hashray
    OrderedHash
  )];

use MooseX::Types::Moose qw(ArrayRef);

use Spark::Couplet;

role_type SparkForm, { does => 'Spark::Form' };

role_type SparkField, { does => 'Spark::Field' };

role_type SparkNode, { does => 'Spark::Node' };

role_type SparkObject, { does => 'Spark::Object' };

role_type SparkValidator, { does => 'Spark::Validator' };

class_type SparkContainer, {class => 'Spark::Container'};

# A balanced list, suitable for turning immediately into a hash
subtype Hashray,
    as ArrayRef,
    where {@$_ % 2 == 0};

class_type OrderedHash, {class => 'Spark::OrderedHash'};
coerce OrderedHash,
    from Hashray,
    via {
      require Spark::OrderedHash;
      my $x = Spark::OrderedHash->new();
      $x->pairwise($_);
      $x
};

1;
__END__
