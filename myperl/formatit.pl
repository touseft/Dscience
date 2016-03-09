#!/usr/local/bin/perl

use Text::Wrap qw($columns &wrap);

use Text::Wrap      qw(&wrap $columns);
($columns) = 60;
($/, $\)  = ('', "\n\n");   # read by paragraph, output 2 newlines
while (<>) {                # grab a full paragraph
    s/\s*\n\s*/ /g;         # convert intervening newlines to spaces
    print wrap('', '', $_); # and format
}
