package Spark::Form::Field::Validator;

use Moose::Role;

requires 'validate';

has field => (
    isa      => 'Spark::Form::Field',
    is       => 'rw',
    required => 1,
    weak_ref => 1,
);

# __PACKAGE__->meta->make_immutable;
1;
__END__

=head1 NAME

Spark::Form::Field::Validator - Base role for field validator objects

=head1 SYNOPSIS

 package MyApp::Validator::Numeric;
 use Moose;
 with 'Spark::Form::Field::Validator';

 sub validate {
   my $self = shift;
   unless ($self->field =~ /^[0-9]+$/) {
     $self->field->error("$self->field->human_name is not numeric");
   }
 }

=head1 COPYRIGHT

Copyright 2011 James Laver

=head1 LICENCE

Licensed under the same terms as Perl itself.

=cut
