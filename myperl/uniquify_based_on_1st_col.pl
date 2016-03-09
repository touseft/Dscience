#!/usr/local/bin/perl

%instancehash = ();

while (<>)
{
  chomp;
  @linearray = split (" ", $_);

  if (exists($instancehash{$linearray[0]}))
  {
     $instancehash{$linearray[0]}[0]++;
  }
  else
  {
    $instancehash{$linearray[0]}[0] = 1;
    $instancehash{$linearray[0]}[1] = $_;
  }
}

#########################################
# Print the unique list sorted and based
# on the number of a occurances
#########################################
@asdf = sort { $instancehash{$b}[0] <=> $instancehash{$a}[0] } (keys %instancehash);


foreach $a (@asdf)
{
  print "$instancehash{$a}[0] $instancehash{$a}[1]\n";
}

