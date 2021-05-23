#!/usr/bin/perl -w
#===============================================================================
#
#         FILE: suda.pl
#
#        USAGE: ./suda.pl
#
#  DESCRIPTION: Converts utf-8 text from TLG to dsl format
#       AUTHOR: proteus (), proteus@softhome.net
#      VERSION: 1.0
#      CREATED: 05/23/2021
#===============================================================================

use strict;
use warnings;
use utf8;
use File::Slurp::Unicode;
binmode STDOUT, ":utf8";


my $suda_text = "tmp.utf";

my $suda = read_file($suda_text, encoding => 'utf8' );

my @lemas = split(/\x{a7}/, $suda);
shift @lemas;

foreach my $lema (@lemas){
  my ($adler, $head, $body);
  $lema =~ m/^(\w+(?:\s\w+)?\.\d+[a-z]?)\s?/;
  $adler = $1;
  $lema =~ s/\n?\s+/ /gs;
  $lema =~ s/\- //g;
  $lema =~ m/\d+[a-z]?\s*\x{2329}?
             (\w+\x{1fbd}?(?:\s*\x{1fbd}?\w+\x{1fbd}?\;?)*?)(?:\x{232a}|\:|\x{0387}|\,|\.|\;)
            /xs;
  $head = $1;
  $body = $';
  $body =~ s/^\x{232a}//;
  $body =~ s/\x{2329}/[b]/gs;
  $body =~ s/\x{232a}/[\/b]/gs;
  $body =~ s/^/[m1]/;
  $body =~ s/\s+$/[\/m]/;

  #----------------------------------------------------------------------------
  #  To have the Adler number as part of the headword
  #  uncomment the next 2 lines
  #----------------------------------------------------------------------------
  # print "$head  ";
  # print "($adler)\n";

  #----------------------------------------------------------------------------
  #  And comment out the next 2 lines
  #----------------------------------------------------------------------------
  print "$head\n";
  print "\t[m1][c limegreen]$adler [/c]\n";

  print "\t$body\n";
}
