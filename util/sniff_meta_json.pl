#!/usr/bin/env perl

use strict;
use warnings;
# FILENAME: sniff_meta_json.pl
# CREATED: 25/08/11 16:11:55 by Kent Fredric (kentnl) <kentfredric@gmail.com>
# ABSTRACT: Scrape the dists code and make a API representation in JSON

use Path::Class::Dir;
use Path::Class::File;

my ( $util_dir, $project_root, $libs );

BEGIN {
  $util_dir = Path::Class::File->new(__FILE__)->parent;
  $project_root = $util_dir->parent;
  $libs         = $project_root->subdir('lib');
}

use lib $libs->absolute->stringify;

my %data;

use Package::Stash;


sub i_package {
  my ( $file, $package ) = @_;

  my $stash = Package::Stash->new( $package );

  if( not exists $data{$file} ){
    $data{$file} = {};
  }

  if ( not exists $data{$file}->{packages} ){
    $data{$file}->{packages} = {};
  }
  my $symbols = $stash->get_all_symbols;
  $data{$file}->{packages}->{$package} = {
    #  symbols => [ keys %{$symbols} ],
    #isa     => $stash->get_symbol('@ISA'),

  };

  my $meta = $symbols->{meta};
  if ( $meta ){
    #$data{$file}->{packages}->{$package}->{meta}->{isa} = $package->meta . "";
  }
  if ( $meta and $package->meta->isa( 'Moose::Meta::Class' ) ) {
    $data{$file}->{packages}->{$package}->{properties}->{class} = $package->meta . "";

    $data{$file}->{packages}->{$package}->{roles} = [ map { $_->name } $package->meta->calculate_all_roles_with_inheritance] ;
    $data{$file}->{packages}->{$package}->{superclasses} = [ map { $_ ."" } $package->meta->superclasses] ;
    $data{$file}->{packages}->{$package}->{immutable} =  $package->meta->is_immutable;
    $data{$file}->{packages}->{$package}->{pristine} =  $package->meta->is_pristine;
    $data{$file}->{packages}->{$package}->{linearized_isa} =  [ $package->meta->linearized_isa ];
    $data{$file}->{packages}->{$package}->{subclasses} =  [ $package->meta->subclasses];
    $data{$file}->{packages}->{$package}->{direct_subclasses} =  [ $package->meta->subclasses];
    $data{$file}->{packages}->{$package}->{methods} =  [ $package->meta->get_method_list ];
    $data{$file}->{packages}->{$package}->{all_methods} =  [ $package->meta->get_all_method_names ];
    $data{$file}->{packages}->{$package}->{attributes} =  [ map { $_ } $package->meta->get_attribute_list ];
    $data{$file}->{packages}->{$package}->{all_attributes} =  [ map { $_->name } $package->meta->get_all_attributes ];


  }
  if ( $meta and $package->meta->isa( 'Moose::Meta::Role' ) ) {
    $data{$file}->{packages}->{$package}->{properties}->{role} =  $package->meta . "";
    $data{$file}->{packages}->{$package}->{consumers} [ map { $_ . "" } $package->meta->consumers ];
    $data{$file}->{packages}->{$package}->{own_roles} = [ map { $_->name } @{$package->meta->get_roles}] ;
    # $data{$file}->{packages}->{$package}->{roles} = [ map { $_->name } $package->meta->calculate_all_roles] ;
    $data{$file}->{packages}->{$package}->{requires} = [ map { $_ . "" } $package->meta->get_required_method_list ];
    $data{$file}->{packages}->{$package}->{methods} =  [ $package->meta->get_method_list ];
    $data{$file}->{packages}->{$package}->{attributes} =  [ $package->meta->get_attribute_list ];

  }

}
my @probe_pkg;

$libs->recurse(callback => sub {
        my $file = shift;
        return if $file->is_dir;
        return unless $file->basename =~ /\.pm$/;
        my $fh = $file->openr();
        my $package;
        my $objects = 0;
        my %stash = (
          filename => $file->relative( $project_root )->stringify,
        );
        my $filename = $file->relative('.')->stringify;

        print "\e[32m$filename\e[0m\n";
        eval {
          require $filename;
        } or warn "$@";

        while (my $line = <$fh>) {
            if ($line =~ /^package\s*(\S+);/) {
                push @probe_pkg, [ $file, $1 ];
                #i_package( $file, $1 );
                next;
            }
            if ($line =~ /^##\s*package\s+(\S)+/ ){
                 push @probe_pkg, [ $file, $1 ];
                 #i_package( $file, $1);
                next;
            }
        }
        return;
});
for my $probe ( @probe_pkg ){
  i_package( @{ $probe });
}

use JSON;

my $j = JSON->new();
$j->pretty(1);

*STDOUT->print($j->encode(\%data));

