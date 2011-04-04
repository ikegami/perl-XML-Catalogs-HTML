use 5;

package XML::Catalogs::HTML;

use strict;
use warnings;

use version; our $VERSION = qv('v1.0.1');

use XML::Catalogs qw( );
our @ISA = 'XML::Catalogs';

1;

__END__

=head1 NAME

XML::Catalogs::HTML - Catalog of HTML and XHTML DTDs


=head1 VERSION

Version 1.0.1


=head1 SYNOPSIS

    use XML::Catalogs::HTML -libxml;

        ---

    use XML::Catalogs::HTML;

    XML::Catalogs::HTML->notify_libxml();

        ---

    use XML::Catalogs::HTML;

    my $url  = XML::Catalogs::HTML->get_catalog_url();
    my $path = XML::Catalogs::HTML->get_catalog_path();


=head1 DESCRIPTION

To properly parse named entities in an XML document,
the parser must have access to the XML subformat's DTDs.

L<XML::LibXML>, for one, does not cache DTDs it downloads.
Instead, it relies on them being in the system's XML catalog.
This is not always configured properly for a number of
reasons.

An XML catalog is simply a set of DTDs and a table of contents
that associates DTD identifiers with the DTDs.

This module provides a catalog of HTML and XHTML DTDs
in case they are not present in the system's catalog.

It works on all platforms, it works without requiring root
priviledges, and it works with CPAN's dependency system.

Currently, only the DTDs for HTML 4.01 and
XHTML 1.0 are included in this distribution.
Please let me know if you need earlier versions.


=head1 CLASS METHODS

=over

=item C<< use XML::Catalogs::HTML -libxml >>

This loads XML::Catalogs::HTML and calls
C<< XML::Catalogs::HTML->notify_libxml() >>


=item C<< XML::Catalogs::HTML->notify_libxml() >>

This method informs L<XML::LibXML> of this catalog.
XML::LibXML will use the local DTDs when parsing
HTML and XHTML documents. This only affects the
current process.

This mechanism does not stop working when XML::LibXML's
C<< ->no_network(1) >> option is used. When using that
option, XML::LibXML refrains from downloading remote
resources.


=item C<< XML::Catalogs::HTML->get_catalog_url() >>

Returns a file:// URL to the catalog.


=item C<< XML::Catalogs::HTML->get_catalog_path() >>

Returns the file path of the catalog.


=back

=head1 SEE ALSO

=over 4

=item * L<http://en.wikipedia.org/wiki/XML_Catalog>, Wikipedia's entry on XML Catalogs.

=item * L<XML::LibXML>, an excellent XML parser that supports catalogs.

=item * L<XML::Catalogs>, this module's base class.

=item * L<HTML::DTD>, an alternate source for HTML and XHTML DTDs.

=item * L<http://www.w3.org/blog/systeam/2008/02/08/w3c_s_excessive_dtd_traffic>, An example of the real world effects of not having local DTDs.


=back


=head1 BUGS

Please report any bugs or feature requests to C<bug-XML-Catalogs-HTML at rt.cpan.org>,
or through the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=XML-Catalogs-HTML>.
I will be notified, and then you'll automatically be notified of progress on your bug as I make changes.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc XML::Catalogs::HTML

You can also look for information at:

=over 4

=item * Search CPAN

L<http://search.cpan.org/dist/XML-Catalogs-HTML>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=XML-Catalogs-HTML>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/XML-Catalogs-HTML>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/XML-Catalogs-HTML>

=back


=head1 AUTHOR

Eric Brine, C<< <ikegami@adaelis.com> >>


=head1 COPYRIGHT & LICENSE

The .dtd and .ent files included in this distrubution are
covered by Copyright. See the individual files for the notice.
The may be distributed unmodified unmodified. See
L<http://www.w3.org/Consortium/Legal/2002/copyright-documents-20021231>
for the exact terms.

Everything else is public domain. No rights reserved.

Feel free to use this module as a model for your own
XML::Catalogs::* module.


=cut
