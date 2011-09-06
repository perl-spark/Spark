use strict;
use warnings;

package Spark::Util;

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
__END__
