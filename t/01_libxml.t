#!/usr/bin/perl -w

use strict;
use warnings;

use Test::More;

BEGIN {
    if (!eval { require XML::LibXML; }) {
        plan skip_all => 'XML::LibXML not installed';
    } else {
        plan tests => 3;
    }
}

use XML::Catalogs::HTML;

my $xhtml = <<'__EOI__';
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Test</title>
</head>
<body>abcd&eacute;fghij</body>
</html>
__EOI__

my $parser = XML::LibXML->new();
$parser->no_network(1);

my $doc;
SKIP: {
    $doc = eval { $parser->parse_string($xhtml) }
        and skip("Control test didn't throw exception", 2);

    like("$@", qr/Entity 'eacute' not defined/, "Control test");

    XML::Catalogs::HTML->notify_libxml();

    $doc = eval { $parser->parse_string($xhtml) };
    my $e = $@;
    ok($doc, "Use of local DTD by libxml")
        or diag("Got exception $e");
}

my $body_text = eval { ( $doc->findnodes('//*[name()="body"]') )[0]->textContent() };
is($body_text, "abcd\x{E9}fghij", "Entity decoding");
