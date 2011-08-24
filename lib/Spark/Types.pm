package Spark::Types;

my @classes;
my @roles;
my @decls;

BEGIN {
    my @wheels = qw(
      Button
      Checkbox
      Dummy
      File
      Hidden
      Image
      MultiSelect
      Password
      Radio
      RadioGroup
      Reset
      Select
      Submit
      Text
      Textarea
    );

    @classes = (
        (map { q[Spark::] . $_ }
              qw(
              Collection
              Form::Field::Result
              Form::Field::Validator::Result
              Form::Loader
              Form::PluginLoader
              Form::Result
              Form::Validator::Result
              Form::Validator
              Hashray
              Load
              Renderer::Container::Form
              Result::Item
              Result
              Validates::WithValidators
              Validator::Node
              Validator::Regex
              )),
        (map { q[Spark::Wheel::] . $_ } @wheels),
        (map { q[Spark::Wheel::] . $_ . q[::Renderer::HTML] } @wheels),
    );
    @roles = (
        (map { q[Spark::] . $_ } qw(
              Container
              Field::Named
              Field::Validates
              Field
              Labelled
              Named
              Node
              Object
              Parent
              Renderer::Container
              Renderer
              Renders
              Simple::Field
              Simple::Form
              Simple::Node
              Validates
              Validator
              )),
        (map { q[Spark::Form::] . $_ } qw(
              Field::Validator
              Printer::HTML
              Printer::XHTML
              Printer
              Role::Validity
              Source
              )),
        (map { q[Spark::Form::Field::Role::] . $_ } qw(
              NewValidator
              Printable::HTML
              Printable::XHTML
              Printable
              )),
    );
    @decls = map { my $x = $_; $x =~ s/:://g; $x } @classes, @roles;
}

use MooseX::Types -declare => [qw( Hashray BalancedList ), @decls,];

use MooseX::Types::Moose qw(ArrayRef);

for my $classname (@classes) {
    my $shortname = $classname;
    $shortname =~ s/:://g;
    eval qq[class_type $shortname, {
    class => "$classname",
    message => sub { "\$_ is not of class '$classname'" },
  };];
}
for my $rolename (@roles) {
    my $shortname = $rolename;
    $shortname =~ s/:://g;
    eval qq[role_type $shortname, {
    role => "$rolename",
    message => sub { "\$_ is not of role '$rolename'" },
  };];
}

class_type Hashray, {class => 'Spark::Hashray'};

subtype BalancedList,
  as ArrayRef,
  where { @{$_} % 2 == 0 };

coerce Hashray,
  from BalancedList,
  via {
    require Spark::Hashray;
    return Spark::Hashray->new(@{$_});
  };

coerce SparkHashray,
  from BalancedList,
  via {
    require Spark::Hashray;
    return Spark::Hashray->new(@{$_});
  };

1;
__END__
