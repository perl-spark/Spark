use strict;
use warnings;

package Spark::Wheel::Reset;
{
  $Spark::Wheel::Reset::VERSION = '0.1.0';
}

use Moose;

with 'Spark::Simple::Field';
use namespace::autoclean;

# Seriously, has ever anyone had a use for a form reset button?
# "Throw away everything I just typed" is really annoying,
# especially if it happened to be beside the submit button,
# and you slip and ARRRRGH, NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO0.
#
# Its stuff like that that causes science fiction movies.
has '+renderer' => (
    default => sub {
        require Spark::Wheel::Reset::Renderer::HTML;

        Spark::Wheel::Reset::Renderer::HTML->new;
      }
);

__PACKAGE__->meta->make_immutable;

1;


=pod

=encoding utf-8

=head1 NAME

Spark::Wheel::Reset

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


__END__
