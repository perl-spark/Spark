
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Spark-Form',
  NAME      => 'Spark::Form',
  AUTHOR    => 'James\ Laver\ L\<http\:\/\/jameslaver\.com\>',
  ABSTRACT  => 'A\ simple\ yet\ powerful\ forms\ validation\ system\ that\ promotes\ reuse\.',
  VERSION   => '0.03',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "Test::MockObject" => '0',
    "Module::Pluggable" => '0',
    "List::Util" => '0',
    "Data::Couplet" => '0',
    "Test::More" => '0',
    "MooseX::AttributeHelpers" => '0',
    "Test::MockObject::Extends" => '0',
    "List::MoreUtils" => '0',
    "Moose" => '0',
    "HTML::Tiny" => '0',
  },
);
