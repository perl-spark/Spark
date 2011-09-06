use strict;
use warnings;

package Spark::Util;
{
  $Spark::Util::VERSION = '0.1.0';
}

use Exporter();
use parent qw(Exporter);
use namespace::autoclean;

our @EXPORT_OK = qw(
  form_result     form_validator_result
  field_result    field_validator_result
);

sub form_result {
    my (@args) = @_;
    my (@objects);

    require Spark::Form::Validator::Result;

    if (@args) {
        foreach my $msg (@args) {
            push @objects, Spark::Form::Validator::Result->new(bool => undef, message => $msg,);
        }
    } else {
        push @objects, Spark::Form::Validator::Result->new(bool => 1,);

    }
    return @objects;
}

sub field_result {
    my (@args) = @_;
    my (@objects);
    require Spark::Form::Field::Validator::Result;
    if (@args) {
        foreach my $msg (@args) {
            push @objects, Spark::Form::Field::Validator::Result->new(bool => undef, message => $msg,);
        }
    } else {
        push @objects, Spark::Form::Field::Validator::Result->new(bool => 1,);
    }
    return @objects;
}

1;


=pod

=encoding utf-8

=head1 NAME

Spark::Util

=head1 VERSION

version 0.1.0

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
