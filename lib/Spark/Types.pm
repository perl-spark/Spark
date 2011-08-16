package Spark::Types;

use MooseX::Types
  -declare => [qw(
    SparkForm
    SparkField
    SparkNode
    SparkObject
    SparkValidator
    Hashray
    OrderedHash
  )];

use MooseX::Types::Moose qw(Ref);

use Spark::Couplet;

subtype SparkForm,
    as Ref,
    where {$_->meta->does('Spark::Form')};

subtype SparkField,
    as Ref,
    where {$_->meta->does('Spark::Field')};

subtype SparkNode,
    as Ref,
    where {$_->meta->does('Spark::Node')};

subtype SparkObject,
    as Ref,
    where {$_->meta->does('Spark::Object')};

subtype SparkValidator,
    as Ref,
    where {$_->meta->does('Spark::Validator')};

class_type SparkContainer, {class => 'Spark::Container'};

# A balanced list, suitable for turning immediately into a hash
subtype Hashray,
    as ArrayRef,
    where {@$_ % 2 == 0};

class_type OrderedHash, {class => 'Spark::OrderedHash'};
coerce OrderedHash,
    from Hashray,
    via { my $x = OrderedHash->new(); $x->pairwise($_); $x };

1;
__END__
