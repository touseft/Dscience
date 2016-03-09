#!/usr/local/bin/perl

@totalarray = ();
@slacklinearray = (); 
@slackarray = (); 

$aggressor_count = 0;
while (<>)
{
  if ($_ !~ /Total:/)
  {
    next;
  }
  chomp;
  @totalarray = split(" ", $_);
  while (<>) {
    if ($_ !~ /Aggressors:/)
    {
      next;
    }
    while (<>)
    {
      if ($_ !~ /Propagated:/)
      {
        $aggressor_count++;
        next;
      }
      while (<>)
      {
        if ($_ =~ /^1/)
        {
          last;
        }
        if ($_ !~ /slack /)
        {
          next;
        }
        chomp;
        @slacklinearray = split (" ", $_); 
        push(slackarray, $slacklinearray[2]);
        #print "$slacklinearray[2]\n";
      }
      last;
    }
    last;
  }

  print "$totalarray[3] $aggressor_count ";
  $slackcount = @slackarray;
  for ($i=0; $i<$slackcount;$i++)
  {
    print "$slackarray[$i] ";
  }
  print "\n";
  

  @totalarray = ();
  @slacklinearray = (); 
  @slackarray = (); 
  $aggressor_count = 0;
}

