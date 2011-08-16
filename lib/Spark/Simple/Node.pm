package Spark::Simple::Node;

use Moose::Role;

with 'Spark::Node','Spark::Validates';

use Spark::Types qw(:all);

sub validate {
    my ($self, $data) = @_;
    my $result = Spark::Result->new;
    if ($self->can('_validate')) {
        my @ret = $self->_validate($data);
        $result->push(form_result(@ret));
    }
    foreach my $f (@{$self->children}) {
      if (is_SparkValidates($f)) {
        my $ret = $f->validate($self, $data);
        $result->push($ret);
      }
    }
    foreach my $v (@{$self->validators}) {
        my @ret = $v->validate($self, $data);
        $result->push(form_result(@ret));
    }

    return $result;
}

1;
__END__
