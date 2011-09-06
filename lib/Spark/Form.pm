use strict;

package Spark::Form;
{
  $Spark::Form::VERSION = '0.1.0';
}

# ABSTRACT: A simple yet powerful forms validation system that promotes reuse.

use Moose::Role 0.90;
use MooseX::Types::Moose qw( :all );
use MooseX::LazyRequire;
use Spark::Types qw( :all );
use List::MoreUtils 'all';
use Carp;
use Scalar::Util qw( blessed );
use namespace::autoclean;
with 'MooseX::Clone';

with 'Spark::Form::Role::PluginLoader' => {
    namespaces => ['SparkX::Form::Field', 'Spark::Form::Field'],
    construct_method_name => '_construct_plugin',
};

with 'Spark::Node';
with 'Spark::Parent';

sub add {
    my ($self, $item) = @_;

    croak(q{Add requires a Spark::Field}) unless is_SparkField($item);
    return $self->_add_child($item);
}

# sub clone_all {
#     my ($self) = @_;
#     my $new = $self->clone;
#     $_->form($self) foreach $new->fields;

#     return $new;
# }

# sub clone_except_names {
#     my ($self, @fields) = @_;
#     my $new = $self->clone_all;
#     $new->remove($_) foreach @fields;

#     return $new;
# }

# #
# # ->_except( \@superset , \@things_to_get_rid_of )
# #

# sub _except {
#     my ($self, $input_list, $exclusion_list) = @_;
#     my %d;
#     @d{@{$exclusion_list}} = ();

#     return grep {
#         !exists $d{$_}
#     } @{$input_list};
# }

# sub clone_only_names {
#     my ($self, @fields) = @_;
#     my @all = $self->keys;
#     my @excepted = $self->_except(\@all, \@fields);
#     return $self->clone_except_names(@excepted);
# }

# sub clone_except_ids {
#     my ($self, @ids) = @_;
#     my $new = $self->clone_all;
#     $new->remove_at(@ids);

#     return $new;
# }

# sub clone_only_ids {
#     my ($self, @ids) = @_;
#     my @all = 0 .. $self->field_couplet->last_index;

#     return $self->clone_except_ids($self->_except(\@all, \@ids));
# }

# sub clone_if {
#     my ($self, $sub) = @_;
#     my (@all) = ($self->field_couplet->key_values_paired);
#     my $i = 0 - 1;

#     # Filter out items that match
#     # coderef->( $current_index, $key, $value );
#     @all = grep {
#         $i++;
#         !$sub->($i, @{$_});
#     } @all;

#     return $self->clone_except_names(map { $_->[0] } @all);
# }

# sub clone_unless {
#     my ($self, $sub) = @_;
#     my (@all) = $self->field_couplet->key_values_paired;
#     my $i = 0 - 1;

#     # Filter out items that match
#     # coderef->( $current_index, $key, $value );

#     @all = grep {
#         $i++;
#         $sub->($i, @{$_});
#     } @all;
#     return $self->clone_except_names(map { $_->[0] } @all);
# }

# sub compose {
#     my ($self, $other) = @_;
#     my $new       = $self->clone_all;
#     my $other_new = $other->clone_all;
#     foreach my $key ($other_new->keys) {
#         $new->add($other_new->get($key));
#     }
#     return $new;
# }

# Can't immutiblize roles
#__PACKAGE__->meta->make_immutable;

1;



=pod

=encoding utf-8

=head1 NAME

Spark::Form - A simple yet powerful forms validation system that promotes reuse.

=head1 VERSION

version 0.1.0

=head1 SYNOPSIS

 use Spark::Form;
 use Spark::GPC;
 use CGI;              # Because it makes for a quick and oversimplistic example
 use Third::Party::Field; # You can add custom field types
 use SparkX::Form::Field::Select; # Fields with complex arguments need creating
                                  # explicitly

 my $form = Spark::Form->new(plugin_ns => 'MyApp::Field'
                             # Tell the form how to print itself
                             printer => "SparkX::Form::Printer::List"
                             );


 # Add some fields to the form.
 $form->add('email','email',confirm_field => 'email-confirm')
      ->add('email','email-confirm')
      ->add('password','password',regex => qr/^\S{6,}$/)
      ->add('select','selectName', options => [qw/foo bar baz/], value => 'bar')
      # This one will be autoloaded from MyApp::Field::Username
      ->add('username','username')
      # And this shows how you can use a third party field of any class name
      ->add(Third::Party::Field->new(name => 'blah'))
      ;

 #Give it data to validate against
 my $gpc = Spark::Form::GPC->new;
 $gpc->pairwise(CGI->new->params);

 # And do the actual validation
 my $result = $form->validate($gpc);
 if ($result->valid) {
     print "You are now registered";
 } else {
     # List the errors
     print join "\n", $form->errors;
     # Redisplay the form
     print $form; # This will use SparkX::Form::Printer::List
 }

and over in MyApp/Field/Username.pm...

 package MyApp::Form::Field::Username;
 use base Spark::Form::Field;

 sub _validate {
   my ($self,$gpc) = @_;
   # Grab the value from the gpc structure
   my $v = $gpc->get_one($self->name);
   # Return something to raise an error
   if (length $v < 6 or length $v > 12) {
     return "Usernames must be 6-12 characters long";
   } elsif ($v =~ /[^a-zA-Z0-9_-]/) {
     return "Usernames may contain only a-z,A-Z,0-9, _ and -";
   }
 }

=head1 INSTABILITY

Periodically the API may break. I'll try to make sure it's obvious so it doesn't silently malfunction.

By 0.5, we shouldn't have to do this.

=head1 DEPENDENCIES

Moose. I've dropped using Any::Moose. If you need the performance increase, perhaps it's time to start thinking about shifting off CGI.

=head1 METHODS

=head2 import (%options)

Allows you to set some options for the forms class.

=over 4

=item class => String

Optional, gives the basename for searching for form plugins.

Given 'MyApp', it will try to load form plugins from MyApp::Form::Field::*

=item source => String

Optional, names a plugin to try and extract form data from.

If unspecified, you will need to call $form->data(\%data);

=back

=head2 add ($thing,@rest)

If $thing is a string, attempts to instantiate a plugin of that type and add it
to the form. Requires the second argument to be a string name for the field to identify it in the form. Rest will become %kwargs
If it is an ArrayRef, it loops over the contents (Useful for custom fields, will probably result in bugs for string field names).@rest will be passed in each iteration.
If it looks sufficiently like a field (implements Spark::Form::Field),
then it will add it to the list of fields. @rest will just become %kwargs

Uses 'field name' to locate it from the data passed in.

This is a B<streaming interface>, it returns the form itself.

=head2 validate

Validates the form. Sets C<valid> and then also returns the value.

=head2 data

Allows you to pass in a HashRef of data to populate the fields with before validation. Useful if you don't use a plugin to automatically populate the data.

This is a B<streaming interface>, it returns the form itself.

=head2 fields () => Fields

Returns a list of Fields in the form in their current order

=head2 BUILD

Moose constructor. Test::Pod::Coverage made me do it.
Adds C<class> to the search path for field modules.

=head2 get (Str)

Returns the form field of that name

=head2 get_at (Int)

Returns the form field at that index (counting from 0)

=head2 keys () :: Array

Returns the field names

=head2 field_couplet () :: Data::Couplet

Returns the Data::Couplet used to store the fields. Try not to use this too much.

=head2 remove (Array[Str]) :: Spark::Form

Removes the field(s) bearing the given name(s) from the form object. Silently no-ops any that do not exist.

=head2 remove_at (Array[Int]) :: Spark::Form

Removes the field at the given ID(s) from the form object. Silently no-ops any that do not exist.

WARNING: Things will get re-ordered when you do this. If you have a form with
IDs 0..3 and you remove (1, 3), then (0, 2) will remain but they will now be
(0, 1) as L<Data::Couplet> will move them to keep a consistent array.

=head2 clone_all () :: Spark::Form

Returns a new copy of the form with freshly instantiated fields.

=head2 clone_except_names (Array[Str]) :: Spark::Form

Clones, removing the fields with the specified names.

=head2 clone_only_names (Array[Str]) :: Spark::Form

Clones, removing the fields without the specified names.

=head2 clone_except_ids (Array[Int]) :: Spark::Form

Clones, removing the fields with the specified IDs.

=head2 clone_only_ids (Array[Int]) :: Spark::Form

Clones, removing the fields without the specified IDs.

=head2 clone_if (SubRef[(Int, Str, Any) -> Bool]) :: Spark::Form

Clones, removing items for which the sub returns false. Sub is passed (Id, Key, Value).

=head2 clone_unless (SubRef[(Int, Str, Any) -> Bool]) :: Spark::Form

Clones, removing items for which the sub returns true. Sub is passed (Id, Key, Value).

=head2 compose (Spark::Form) :: Spark::Form

Clones the current form object and copies fields from the supplied other form to the end of that form.
Where names clash, items on the current form take priority.

=head1 Docs?

L<http://sparkengine.org/docs/forms/>

=head2 Source?

L<http://github.com/perl-spark/Spark-Form/>

=head1 THANKS

Thanks to the Django Project, whose forms module gave some inspiration.

=head1 SEE ALSO

The FAQ: L<Spark::Form::FAQ>
L<Data::Couplet> used to hold the fields (see C<field_couplet>)

=head1 AUTHORS

=over 4

=item *

James Laver L<http://jameslaver.com>

=item *

Kent Fredric <kentnl@cpan.org>

=item *

Paweł Murias <pawelmurias@gmail.com>

=item *

David Dorward <david@dorward.me.uk>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by James Laver C<< <sprintf qw(%s@%s.%s cpan jameslaver com)> >>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__END__

