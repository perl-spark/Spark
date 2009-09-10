package Spark::Form::Source;
our $VERSION = '0.0300';


# ABSTRACT: Base class for population plugins

use Moose::Role;

requires 'populate';

1;



=pod

=head1 NAME

Spark::Form::Source - Base class for population plugins

=head1 VERSION

version 0.0300

=head1 SEE ALSO

L<Spark::Form> - What you were probably after



=head1 AUTHOR

  James Laver L<http://jameslaver.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by James Laver C<< <sprintf qw(%s@%s.%s cpan jameslaver com)> >>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut 



__END__

