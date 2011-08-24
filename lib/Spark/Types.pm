package Spark::Types;

use parent 'MooseX::Types::Combine';

use List::Util qw( first );

# This exists because :all is not supported yet at MX-Types 0.29.
# Patch sent to upstream as topic/support_all

sub import {
    my ($class, @types) = @_;
    my $caller = caller;

    my %types = $class->_provided_types;

    if (first { $_ eq ':all' } @types) {
        $_->import({-into => $caller}, q{:all}) for $class->provide_types_from;
        return;
    }

    my %from;
    for my $type (@types) {
        unless ($types{$type}) {
            my @type_libs = $class->provide_types_from;

            die
              "$caller asked for a type ($type) which is not found in any of the"
              . " type libraries (@type_libs) combined by $class\n";
        }

        push @{$from{$types{$type}}}, $type;
    }

    $_->import({-into => $caller}, @{$from{$_}})
      for keys %from;
}

__PACKAGE__->provide_types_from(qw(
      Spark::Types::Classes
      Spark::Types::Roles
      Spark::Types::Misc
      ));

1;
__END__
