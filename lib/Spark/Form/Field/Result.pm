use strict;
use warnings;

package Spark::Form::Field::Result;
{
  $Spark::Form::Field::Result::VERSION = '0.1.0';
}

use Moose;
use MooseX::Types::Moose qw( :all );
use Spark::Types qw( :all );
use namespace::autoclean;

has _results => (
    isa => ArrayRef [SparkFormFieldValidatorResult],
    is => 'ro',
    default => sub { [] },
    traits  => ['Array'],
    handles => {
        results => 'elements',
        push    => 'push',
        first_r => 'first',
        grep_r  => 'grep',
    },
);

sub bool {
    my ($self) = @_;
    return $self->first_r(sub {
            !$_->bool
    });
}

sub messages {
    my ($self) = @_;
    return $self->grep_r(sub {
            !$_->bool && $_->message
    });
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;

__END__
=pod

=encoding utf-8

=head1 NAME

Spark::Form::Field::Result

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

