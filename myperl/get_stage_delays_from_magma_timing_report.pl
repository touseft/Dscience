#!/usr/local/bin/perl

@timearray = ();

$count = 0;

while (<>)
{
  if ($_ =~ "^#### Path ")
  {
    @linearray = split (" ", $_);
    print "Path=$linearray[2] ";
  }
  
  if ($_ !~ "^#### Path ")
  {
    next;
  }
  #print $_;
  $delay_sum = 0;
  $prev_instance = "";
  $prev_delay = 0;

  while (<>)
  {
    if ($_ !~ "^Clock path")
    {
      next;
    }
    #print $_;
    while (<>)
    {
      $cnt = 0;
      if ($_ !~ "^Data path")
      {
        next;
      }
      $delay_sum = 0;
      $prev_instance = "";
      while (<>)
      {
        if ($_ =~ "Reference clock path")
        {
          $delay_sum = 0;
          $prev_instance = "";
          last;
        }
        if ($_ !~ "/")
        {
          next;
        }
        @linearray = split (" ", $_);
        $instance_name = $linearray[0]; 
        $instance_name =~ s/\/[A-Z]+$//g;

        if ($linearray[0] =~ ":")
        {
          $delay_sum = $linearray[2];
          print "$delay_sum ";
          $cnt++;
          $pre_instance = "";
          $prev_delay = 0;
          next;
        }
       
        else { 
         if ($linearray[0] =~ $prev_instance)
         {
           $delay_sum = $linearray[2] + $prev_delay;
           print "$delay_sum ";
           $cnt++;
         }
         else
         { 
           $delay_sum = $linearray[2];
         }
        }
        $prev_instance = $instance_name; 
        $prev_delay = $linearray[2];
      }
      print "#stages=$cnt\n";
      $delay_sum = 0;
      $prev_instance = "";
      last;
    }
    last;
  }
}
#$size = @timearray;
#for ($i=0; $i<$size; $i++)
#{
#  $j = $i + 1;
#  print "stage $j is $timearray[$i]\n";
#  last;
#}


