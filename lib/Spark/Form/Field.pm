use strict;
package Spark::Form::Field;
BEGIN {
  $Spark::Form::Field::VERSION = '0.2103'; # TRIAL
}

# ABSTRACT: Superclass for all Form Fields

use Moose 0.90;
use MooseX::Types::Moose qw( :all );
use Spark::Form::Types qw( :all );
use MooseX::LazyRequire;

with 'MooseX::Clone';
with 'Spark::Form::Role::Validity';
with 'Spark::Form::Role::ErrorStore';

has name => (
    isa      => Str,
    is       => 'ro',
    required => 1,
);

has form => (
    isa           => SparkForm,
    is            => 'rw',
    lazy_required => 1,
    weak_ref      => 1,              #De-circular-ref
    traits        => ['NoClone'],    #Argh, what will it be set to?
);

has value => (
    is       => 'rw',
    required => 0,
);

sub human_name {
    my ($self) = @_;

    if (is_LabelledObject($self)) {
        return $self->label;
    }
    if (is_NamedObject($self)) {
        return $self->name;
    }
    return q();
}

sub validate {
    my ($self) = @_;
    $self->_clear_errors;
    $self->valid(1);

    #Set a default of the empty string, suppresses a warning
    $self->value($self->value || q());
    $self->_validate;
    # This for moose roles interaction
    return $self->valid;
}

sub _validate { return 1 }

__PACKAGE__->meta->make_immutable;
1;


=pod

=head1 NAME

Spark::Form::Field - Superclass for all Form Fields

=head1 VERSION

version 0.2103

=head1 SYNOPSIS

 package My::Field;
 use Moose;
 require Spark::Form::Field;
 extends 'Spark::Form::Field';
 with 'Spark::Form::Field::Role::Validateable';
 with 'Spark::Form::Field::Role::Printable::XHTML';

 sub _validate {
     my $self = shift;

     #validate existence of data
     if ($self->value) {
         #If we're valid, we should say so
         $self->valid(1);
     } else {
         #error will call $self->valid(0) and also set an error.
         $self->error('no value')
     }

     #And we should return boolean validity
     $self->valid
 }

 sub to_xhtml {
     #Rather poorly construct an XHTML tag
     '<input type="checkbox" value="' . shift-value . '">';
 }

Note that you might want to look into HTML::Tiny.
Or better still, L<SparkX::Form::Field::Plugin::StarML>.

There are a bunch of pre-built fields you can actually use in
L<SparkX::Form::BasicFields>.

=head1 DESCRIPTION

Field superclass. Must subclass this to be considered a field.

=head1 ACCESSORS

=head2 name => Str

Name of the field in the data source. Will be slurped on demand.
Required at validation time, not at construction time.

=head2 form => Spark::Form

Reference to the form it is a member of.

=head2 value => Any

Value in the field.

=head2 valid => Bool

Treat as read-only. Whether the field is valid.

=head2 errors => ArrayRef

Treat as read-only. The list of errors generated in validation.

=head1 METHODS

=head2 human_name

Returns the label if present, else the field name.

=head2 validate

Returns true always. Subclass and fill in C<_validate> to do proper validation. See the synopsis.

=head1 SEE ALSO

=over 4

=item L<Spark::Form::Field::Role::Printable> - Fields that can be printed

=item L<SparkX::Form::BasicValidators> - Set of validators to use creating fields

=item L<SparkX::Form::BasicFields> - Ready to use fields

=back

=head1 AUTHOR

James Laver L<http://jameslaver.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by James Laver C<< <sprintf qw(%s@%s.%s cpan jameslaver com)> >>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__END__

