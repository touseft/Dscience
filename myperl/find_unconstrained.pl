#!/usr/local/bin/perl

@paths = ();

while (<>)
{
  if ($_ =~ /Total:/)
  {
    $count = @paths;
    for ($i=0; $i< $count; $i++)
    {
      print $paths[$i];
    }
  }
  push (@paths, $_);

  if ($_ =~ / unconstrain/)
  {
    @paths = ();

    while (<>)
    {
      if ($_ !~ /Total:/)
      {
        next;
      }
      push (@paths, $_);
      last;
    }
  }
}
