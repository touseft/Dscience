#!/usr/local/bin/perl

%endpointhash = ();

while (<>)
{
  while (<>)
  {
    if ($_ !~ /\/Q/)
    {
      next; 
    }
    else
    {
      if ($_ =~ / source/)
      {
        next;
      }
      last;
    }
  }

  chomp;
  $start = $_;

  @startarray = split (" ",$start);
  $startpt = $startarray[0];

  while (<>)
  {
    if ($_ !~ /  slack /)
    {
      next;
    }
    chomp;
    $slack = $_;
    last;
  }

  @startarray = split (" ", $start);
  $startpt = $startarray[0];
  @slackarray = split (" ", $slack);

  if (exists ($endpointhash{$startarray[0]}) )
  {
    $slack = $endpointhash{$startarray[0]};
    if ($slack > $slackarray[2])
    {
      $endpointhash{$startarray[0]} = $slackarray[2];
    }
  }
  else
  {
    $endpointhash{$startarray[0]} = $slackarray[2];
  }
}


foreach $element (keys %{endpointhash})
{
  print "$element $endpointhash{$element}\n";
}

