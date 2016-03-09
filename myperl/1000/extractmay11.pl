#!/usr/local/bin/perl

%endpointhash = ();
while (<>)
{
  if ($_ !~ /\/Q[N]*/)
  {
    next;
  }

  @linearray1 = split (" ", $_);
  while (<>)
  {
    if ($_ !~ /slack /)
    {
      next;
    }
    if ($_ =~ /MET/)
    {
      last;
    }
    @linearray2 = split (" ", $_);
    if (exists ($endpointhash{$linearray1[0]}))
    {
      $slack = $endpointhash{$startarray[0]};
      if ($slack < $linearray2[2])
      {
        $endpointhash{$linearray1[0]} = $linearray2[2];
      }
    }
    else
    {
       $endpointhash{$linearray1[0]} = $linearray2[2];
    }
    last;
  }
}

foreach $element (keys %{endpointhash})
{
  print "$element $endpointhash{$element}\n";
}

