
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "File::Find" => 0,
    "File::Temp" => 0,
    "Module::Build" => "0.3601",
    "Test::Fatal" => 0,
    "Test::More" => "0.88"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "A simple yet powerful forms validation system that promotes reuse.",
  "dist_author" => [
    "James Laver L<http://jameslaver.com>",
    "Kent Fredric <kentnl\@cpan.org>",
    "Pawe\305\202 Murias <pawelmurias\@gmail.com>",
    "David Dorward <david\@dorward.me.uk>"
  ],
  "dist_name" => "Spark",
  "dist_version" => "0.1.0",
  "license" => "perl",
  "module_name" => "Spark",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Carp" => 0,
    "Class::Load" => 0,
    "Exporter" => 0,
    "HTML::Tiny" => 0,
    "List::MoreUtils" => 0,
    "List::Util" => 0,
    "Module::Pluggable::Object" => 0,
    "Moose" => "0.90",
    "Moose::Role" => "0.90",
    "MooseX::Clone" => 0,
    "MooseX::LazyRequire" => "0.04",
    "MooseX::Role::Parameterized" => 0,
    "MooseX::Types" => "0.20",
    "MooseX::Types::Combine" => 0,
    "MooseX::Types::Moose" => 0,
    "MooseX::Types::Perl" => 0,
    "Scalar::Util" => 0,
    "namespace::autoclean" => 0,
    "parent" => 0,
    "perl" => "5.010001",
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
