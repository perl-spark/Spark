
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  'build_requires' => {
    'Data::Dumper' => '0',
    'English' => '0',
    'File::Find' => '0',
    'File::Temp' => '0',
    'Module::Build' => '0.3601',
    'Test::More' => '0.88'
  },
  'configure_requires' => {
    'Module::Build' => '0.3601'
  },
  'dist_abstract' => 'A simple yet powerful forms validation system that promotes reuse.',
  'dist_author' => [
    'James Laver L<http://jameslaver.com>'
  ],
  'dist_name' => 'Spark-Form',
  'dist_version' => '0.2103',
  'license' => 'perl',
  'module_name' => 'Spark::Form',
  'recommends' => {},
  'recursive_test_files' => 1,
  'requires' => {
    'Carp' => '0',
    'Data::Couplet' => '0.02004312',
    'HTML::Tiny' => '0',
    'List::MoreUtils' => '0',
    'List::Util' => '0',
    'Module::Pluggable::Object' => '0',
    'Moose' => '0.90',
    'Moose::Role' => '0.90',
    'MooseX::Clone' => '0',
    'MooseX::LazyRequire' => '0.04',
    'MooseX::Types' => '0.20',
    'MooseX::Types::Moose' => '0',
    'Scalar::Util' => '0',
    'namespace::autoclean' => '0'
  },
  'script_files' => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
