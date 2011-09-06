use strict;
use warnings;

package Spark::Form::Validator::Result;

use Moose;
use MooseX::Types::Moose qw( :all );
use namespace::autoclean;

has bool => (
    isa      => Bool,
    is       => 'ro',
    required => 1,
);

has message => (
    isa     => Str,
    is      => 'ro',
    default => q{},
);
__PACKAGE__->meta->make_immutable;
no Moose;
1;
__END__
