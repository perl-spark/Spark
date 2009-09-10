package SparkX::Form::Printer::List;
our $VERSION = '0.0300';


# ABSTRACT: A list-printer for SparkX::Form. Spouts out form elements in a (X)HTML list.

use Moose::Role;
with 'Spark::Form::Printer';

use HTML::Tiny;

sub to_xhtml {
    shift->_render('to_xhtml', HTML::Tiny->new(mode => 'xml'), @_);
}

sub to_html {
    shift->_render('to_html', HTML::Tiny->new(mode => 'html'), @_);
}

sub _render {
    my ($self, $func, $html, @params) = @_;
    $html->ul(join(' ', $self->_get_lis($func, $html)));
}

sub _get_lis {
    my ($self, $func, $html) = @_;
    map {
        $html->li($html->label($_->human_name)) =>
          $html->li($_->$func)
    } $self->fields;
}

1;



=pod

=head1 NAME

SparkX::Form::Printer::List - A list-printer for SparkX::Form. Spouts out form elements in a (X)HTML list.

=head1 VERSION

version 0.0300

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 FUNCTIONS

=head2 to_html

Prints the form to html

=head2 to_xhtml

Prints the form to xhtml

=head1 ACKNOWLEDGEMENTS



=head1 AUTHOR

  James Laver L<http://jameslaver.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by James Laver C<< <sprintf qw(%s@%s.%s cpan jameslaver com)> >>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut 



__END__

