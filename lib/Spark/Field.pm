use strict;

package Spark::Field;

# ABSTRACT: Role for Fields to implement

use Moose::Role;

with 'MooseX::Clone';

__PACKAGE__->meta->make_immutable;
1;
__END__

=head1 DESCRIPTION

Field superclass. Must subclass this to be considered a field.

=head1 SYNOPSIS

 package My::Field;
 use Moose;
 require Spark::Form::Field;
 extends 'Spark::Form::Field';
 with 'Spark::Form::Field::Role::Validateable';
 with 'Spark::Form::Field::Role::Printable::XHTML';

 sub _validate {
     my ($self,$result,$value) = @_;

     # Really simple validation...
     # Implicit result is success, so ignore that case
     if (!$value) {
         $result->fail('no value');
     }

     #And return the result object
     return $result;
 }

 sub to_xhtml {
     #Rather poorly construct an XHTML tag
     '<input type="checkbox" value="' . shift-value . '">';
 }

Note that you might want to look into HTML::Tiny.
Or better still, L<SparkX::Form::Field::Plugin::StarML>.

There are a bunch of pre-built fields you can actually use in
L<SparkX::Form::BasicFields>.

=head1 ACCESSORS

=head2 name => Str

Name of the field in the data source. Will be slurped on demand.
Required at validation time, not at construction time.

=head2 client_id => Str

ID of the field in the data source. Used by HTML renderers to apply an id
attribute for use with the for attribute of the label element and as a hook
for CSS and JavaScript.

Defaults to the same value as the name. NB: in (X)HTML a name can be
shared but an id must be unique within a document.

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

=cut
