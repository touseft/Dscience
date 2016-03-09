#!/usr/local/bin/perl

@datapath = ();
$linecount = 0;

#while (<>)
#{
#  if ($_ !~ /Date   /)
#  {
#    #print;
#    next;
#  }
#  last;
#
#}
#print;
#$_ = <>;
#print;


while (<>)
{

  if ($_ !~ /Startpoint: /)
  {
    next;
  }

  $linecount = 0;
  $endline = 0;
  while (<>)
  {
    @datapath[$linecount] = $_;
    $linecount++;
  
    if ($_ =~ /data arrival time/)
    {
      $startindex_toprint = 0;
      $endline = $linecount - 2;
      $howmany_lines = 0;
      for ($i=$linecount-2; $i>2; $i--)
      {
        if ( ($datapath[$i] !~ /\/CP /) && ($datapath[$i] !~ /\/CLK/)  )
        {
          #print $datapath[$i];
          $howmany_lines++;
        }
        else {
          last;
        }
      }
      for ($j=$endline-$howmany_lines+1; $j<=$endline; $j++)
      {
        print $datapath[$j];
      }
      last; 
    }
  }
  $linecount = 0;
  @datapath = ();
  print "\#\#\# BREAK LINE \#\#\#\n";
  #last;
}
