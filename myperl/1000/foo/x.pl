#!/usr/local/bin/perl

###################################################################
# Process the command arguments and validate program options passed.
###################################################################
use Getopt::Long;

$filename = "";

GetOptions("file=s" => \$filename, "primetime" => \$primetime, "mantle" => \$mantle, "h!" => \$h);

if ( ($primetime) && ($mantle) ) {
  print "   Cannot specify both options \'-primetime\' and \'-mantle\'.\n";
  print "   Please choose only one or the other.\n\n"; 
  exit (0);
}

if ( (!$primtetime) && (!$mantle) ) {
  print "   Must specify at least one option \'-primetime\' or \'-mantle\'\n\n";
  exit (0);
}


if ($h) {
  print "   dtc.pl -file filename\n";
  print "          -h print this help\n\n";

  exit(0);
}


#######################################################################
# Read the timing reports to be processed into an array for processing
# filename condition    type       STA_mode    slack_tolerance
#           min-min  (setup,hold)  (CLK33)         200 (unit is ps.)
#######################################################################
@lineread = ();
$count = 0;
open (filelistH, "< $filename\0") or die "Can't open $filename for reading: $!\n";
while (<filelistH>)
{
  if ($_ =~ /#/)
  {
    next;
  }
  @lineread[$count] = $_;
  $count++;
}

################################################
# Go through each file in the list and validate
# that the file to be processed does exist.
################################################
@foolineread = ();
for ($i=0; $i<$count; $i++)
{
  @foolineread = split(" ", $lineread[$i]);
  open (foofileH, "< $foolineread[0]\0") or die "Can't open $foolineread[0] for reading: $!\n";
  close(foofileH) or die "Can't close $foolineread[0]: $!\n";
}


##########################
# Variable Initialization
##########################
%endpointhash = ();
@fullpatharray = ();



for ($i=0; $i<$count; $i++)
{
  @foolineread = split(" ",$lineread[$i]);
  $reportfile = $foolineread[0]; 
  $condition = $foolineread[1];
  $type = $foolineread[2];
  $mode = $foolineread[3];
  $tolerance = $foolineread[4];

  $appendstring = $condition . "%" . $type ."%" . $mode;

  open (reportfileH, "< $reportfile\0") or die "Can't open $reportfileH for reading: $!\n";
   
  while (<reportfileH>)
  {
    # Read the report timing file, until you hit a path startpoint
    if ($_ !~ /Startpoint: /)
    {
      next;
    }
    ($foo_keyword,$startpoint) = split();
  
    while (<reportfileH>)
    {
      # Read the report timing file, until you hit a path Endpoint
      if ($_ !~ /Endpoint: /)
      {
        next;
      }
      ($foo_keyword,$endpoint) = split();
      last;
    }

    while (<reportfileH>)
    {
      # Path Group clock domain
      if ($_ !~ /Path Group: /)
      {
        next;
      }
      ($foo_keyword,$pathgroup) = split(": ", $_);
      chop($pathgroup);
      last;
    }

    while (<reportfileH>)
    {
      # Path Type (min, max, etc.) 
      if ($_ !~ /Path Type: /)
      {
        next;
      }
      ($foo_keyword,$pathtype) = split(": ", $_);
      chop($pathtype);
      last;
    }

    # Read up to the ------- line.
    while (<reportfileH>)
    {
      # Read the full from/to path detail from the path report 
      if ($_ !~ /------/)
      {
        next;
      }
      last;
    }

    @detailpath = ();
    $j = 0;
    while (<reportfileH>)
    {
      if ($_ !~ / slack \(/)
      {
        $detailpath[$j] = $_;
        $j++;
        next;
      }
      $detailpath[$j] = $_;
      $j++;
      last;
    }

    #################################################################################
    # It is possible that there is multiple path from a start point to an endpoint.
    # in that case, we will append a count number to each to make sure that each
    # start/end point stays unique.
    #################################################################################
    $startpoint_condition = "$startpoint" . "%" . "$pathtype" . "%" . "$pathgroup" . "%" . "$appendstring";
    $startpoint_condition2 = "$startpointt_condition"  . "%_0";

    #####################################################################
    # Check to see if this startpoint exists in the hash. If it does
    # Then add "_count" to it and look again. Keep searching until
    # you find one that does not exist.  Then add this to the hash tree.
    #####################################################################
    $index = 0;
    while ()
    {
      if (exists ($endpointhash{$endpoint}{startpoint_condition2}) )
      {
        $index++;
        $startpoint_condition2 = "$startpoint_condition" . "%_" . "$index";
        next;
      }
      else
      {
        $startpoint_condition2 = "$startpoint_condition" . "%_" . "$index";
        last;
      } 
    }
    $endpointhash{$endpoint}{$startpoint_condition2} =  [ @detailpath ];
  }


  #foreach $element (keys %{endpointhash})
  #{
  #  foreach $element2 (keys %{$endpointhash{$element}})
  #  {
  #  }
  #
  #}
}

##########################################################
# Just printout every path that you have just read - TEST
##########################################################
foreach $element (keys %{endpointhash})
{
  $visited = 0;
  $positive = 1;

  foreach $element2 (keys %{$endpointhash{$element}})
  {
    $arraysize = @{ $endpointhash{$element}{$element2} };
    @slackarray = split(" ", @{$endpointhash{$element}{$element2}}[$arraysize-1]); 
    if ($slackarray[2] < 0)
    {
      $positive = 0;
      last;
    }
  }

  if (!$positive)
  {  
    foreach $element2 (keys %{$endpointhash{$element}})
    {
      #Get te size of the array
      $arraysize = @{ $endpointhash{$element}{$element2} };
      @slackarray = split(" ", @{$endpointhash{$element}{$element2}}[$arraysize-1]); 

      ($thisendpoint,$condition1,$clockdomain,$condition2,$slacktype,$chipmode) = split("%",$element2);;

      #Print header only once
      if (!$visited) 
      {
        print " Endpoint: $element \n Startpoint: $thisendpoint \n";
        print " MODE                CLOCK             CONDITION             SLACK TYPE          SLACK\n";
        print " =====================================================================================\n";
        $visited++;
      }
      printf " %1s%20s%20s%20s%20.2f\n", $chipmode,$clockdomain,$condition2,$slacktype,$slackarray[2];
    }
    print "\n\n";
  }
}


