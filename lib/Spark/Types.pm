package Spark::Types;

use parent 'MooseX::Types::Combine';

__PACKAGE__->provide_types_from(qw(
  Spark::Types::Classes
  Spark::Types::Roles
  Spark::Types::Misc
));

1;
__END__
