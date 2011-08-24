package Spark::Form::Validator;

use Moose;
use Spark::Form::Types qw( :all );
use namespace::autoclean;

has form => (
    isa      => SparkForm,
    is       => 'rw',
    required => 1,
    weak_ref => 1,
);

sub validate {
    require Carp;
    Carp::carp('Spark::Form::Validator must be subclassed, not used directly');
    return;
}

__PACKAGE__->meta->make_immutable;
1;
__END__

=head1 NAME

Spark::Form::Validator - Base class for form validator objects

=head1 COPYRIGHT

Copyright 2011 James Laver

=head1 LICENCE

Licensed under the same terms as Perl itself.

=cut
