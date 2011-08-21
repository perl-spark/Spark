package Spark::Util;

use Spark::Form::Validator::Result;
use Spark::Form::Field::Validator::Result;

use Exporter();
use parent qw(Exporter);

our @EXPORT_OK = qw(
  form_result     form_validator_result
  field_result    field_validator_result
);

sub form_result {
    my (@args) = @_;
    my (@objects);
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
