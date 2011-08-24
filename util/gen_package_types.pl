#!/usr/bin/env perl 

use strict;
use warnings;

# FILENAME: gen_class.pl
# CREATED: 24/08/11 18:33:14 by Kent Fredric (kentnl) <kentfredric@gmail.com>
# ABSTRACT: Generate Spark::Types::Classes from a template and a dir walk

use Path::Class::Dir;
use Path::Class::File;
use Template;

my $util_dir     = Path::Class::File->new(__FILE__)->parent;
my $project_root = $util_dir->parent;
my $libs         = $project_root->subdir('lib');

my $config = {
    INCLUDE_PATH => $util_dir->subdir('tpl')->absolute->stringify,
};

my @classes;
my @roles;

$libs->recurse(callback => sub {
        my $file = shift;
        return if $file->is_dir;
        return unless $file->basename =~ /\.pm$/;
        my $fh = $file->openr();
        my $package;
        my $short;
        while (my $line = <$fh>) {
            if ($line =~ /^package\s*(\S+);/) {
                $package = $1;
                $short   = $1;
                $short =~ s/:://g;
                next;
            }
            if ($line =~ /^##\s*class(\s|$)/) {
                print "CLASS: $package\n";
                push @classes, {short => $short, long => $package};
                return;
            }
            if ($line =~ /^##\s*role(\s|$)/) {
                print "ROLE: $package\n";
                push @roles, {short => $short, long => $package};
                return;
            }
            if ($line =~ /^use\s+Moose[;\s(]/) {
                print "CLASS: $package\n";
                push @classes, {short => $short, long => $package};
                return;
            }
            if ($line =~ /^use\s+Moose::Role[;\s(]/) {
                print "ROLE: $package\n";
                push @roles, {short => $short, long => $package};
                return;
            }
        }
        if ($package) {
            print "\e[31mUNKNOWN:\e[0m $package\n";
        }
        return;
});
my $template = Template->new($config);

my $class_output;
my $role_output;

$template->process('Spark_Types_Classes.pm.tpl', {
        classes => [sort { $a->{short} cmp $b->{short} } @classes],
        timestamp => scalar gmtime,
}, \$class_output) || die $template->error();

$template->process('Spark_Types_Roles.pm.tpl', {
        roles => [sort { $a->{short} cmp $b->{short} } @roles],
        timestamp => scalar gmtime,
}, \$role_output) || die $template->error();

eval "$class_output" or die "Can't parse code, $@";
eval "$role_output"  or die "Can't parse code, $@";

my $cf = $libs->subdir('Spark')->subdir('Types')->file('Classes.pm');
$cf->parent->mkpath;
my $cfh = $cf->openw;
$cfh->print($class_output);
$cfh->close;

my $rf = $libs->subdir('Spark')->subdir('Types')->file('Roles.pm');
$rf->parent->mkpath;
my $rfh = $rf->openw;
$rfh->print($role_output);
$rfh->close;

