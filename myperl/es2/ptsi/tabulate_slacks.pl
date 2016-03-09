#! /usr/local/bin/perl

#
# open CSVFILE,$file or die;#open input file
# my @matrix; #declare 2d array
# my $i=0; #counter
# while()
# {
# chomp $_;
# my @row=split ",",$_;
# for ($j=0; $j<@rows;$j++)
# {
# $matrix[$i][$j]=$row[$j]; #fill 2d matrix with data
# }
# $i++;
# }
# 
#So, each cell of the 2d matrix now holds the actual data instead of reference to it. For sorting:--
#@matrix_sorted=sort{$b->[0]<=>$a->[0]}@matrix;
#


opendir (DIR, ".") or die "$!";
my @files = grep {/\.txt$/ and /slack_/} readdir DIR;
close DIR;

my @matrix; #declare 2d array

$row = 0;
$col = 0;
foreach my $file (@files) {
  open (FH, "<$file") or die "$!";
  #print " HELLO: $file\n";
  $row = 0;
  while (<FH>) {
    chomp;
    $matrix[$row][$col]=$_;  #fill 2d matrix with data
    #print "$_\n";
    $row++;
  }
  $col++;
  close (FH);

  #open (FH, "<$file") or die "$!";
  #open (OFH, ">$outmfile") or die "$!";
  #print OFH "$mfile\n";
  #close (OFH);

}

$outmfile = "matrix.txt"; 
open (OFH, ">$outmfile") or die "$!";
for($i=0; $i<$row; $i++)
{
  for($j=0; $j<$col; $j++)
  {
    print "$matrix[$i][$j] , ";
  }
  print "\n";
  #$i++;
}
close (OFH);



