#!/usr/local/bin/perl

###########################################################################################################
# Toshiba America Electronic Components
# Program Creation:   Farrokh Touserkani 7/28/05
# Progam revisions:   v1.0beta
#
# This program read a series of LSF batch jobs from a file 
# It then manages the submissino of these jobs based on the number of tool/software licenses available
# The user can specify to submit job to all available licenses, or a specific number of licenses.
#
# The primary target of this was to control submission of Synopsys Primetime jobs,
# but the user can pass as argument any tool feature that is available in lmstat.
#
#
#
#
#
#
############################################################################################################
#use strict;
use Getopt::Long;

###################################
# Initialize the command arguments
###################################
$lmfeature = "";
$keep = -1;
$batchfile = "";


$firsttime = 1;

GetOptions("h!" => \$h, "lmfeature:s" => \$lmfeature, "keep:i" => \$keep, "batchfile:s" => \$batchfile);

if ($h) {
  print "\n";
  print "USAGE: \n";
  print "       lmsub.pl -lmfeature  \"expr\" -keep \"num\" -batchfile \"filename\"\n";
  print "\n";
  print "       <-lmfeature> - Feature name of license in lmstat\n";
  print "       <-keep num>  - Number of licenses to save for others\n";
  print "       <batchfile>  - file name of the LSF batch jobs\n";
  print "\n\n";
  print "       PLEASE SEND EMAIL TO tousef\@taec.com FOR HELP/CHANGES/IMPROVEMENTS.\n";
  print "\n";
  exit(1);
}

######################
# CMD line arguments
######################
if (!$lmfeature) {
  print "\n    -lmfeature switch must be used.  try lmsub.pl -h for help.\n\n";
  exit(1);
}

if (!$batchfile) {
  print "\n    -batchfile switch must be used.  try lmsub.pl -h for help.\n\n";
  exit(1);
}

if ($keep < 0) {
  print "\n    -keep switch must be used.  try lmsub.pl -h for help.\n\n";
  exit(1);
}


@jobslist = ();
$batchjobcount = 0;
################################################################################
# read in a batch file, containing all of the jobs that need to be submitted.
################################################################################
#while (<>)
#{
#  chomp;
#  $jobslist[$batchjobcount] = $_;
#  $batchjobcount++;
#}


################################################################################
#@outputarray = system('lmstat -f primetime', ) or die "Can't exec lmstat: $!";
#Use the `` to execute, but capture the output of the shell script.
################################################################################
$lmfeature_in_use = 0;

@outputarray = `lmstat -f $lmfeature`;
$outputarraysize = @outputarray;

for ($i=0; $i<$outputarraysize; $i++)
{
  $_ = $outputarray[$i];

  #if ($_ =~ /Error getting feature/)
  #{
  #  print "No such lmfeature exists. Please check the spelling and\/or\n"; 
  #  print "check your license server setup that carries an active $lmfeature license\n";
  #  exit(1);
  #}
  
  if ($_ =~ /Total of /)
  {
    @linearray1 = split('\(Total of ', $_);
    @linearray2 = split(" ", $linearray1[1]);
    $total_available = $linearray2[0];
    next;
  }

  if ($_ !~ / start /)
  {
    next;
  }
 
  $lmfeature_in_use = $lmfeature_in_use +1;
}
###########################################
#re-initialize the no. of licenses in use.
###########################################
$lmfeature_in_use = 0;

print "Total license = $total_available\n";
print "Total license in use = $lmfeature_in_use\n";


#################################################################################
# Check to see if any active license is available to run the requested batch job
#################################################################################
if ($total_available == 0)
{
  print "Cannot submit job, as there are no licenses available\n";
  print "Please check your license server setup that carries an active $lmfeature license\n";
  exit(1);
}



###################################
# Loop through and submit the jobs 
###################################
$jobs_to_submit = @jobslist;

while ($jobs_to_submit > 0)
{
  $lmfeature_in_use = lmfeaturecount();
  $lmfeature_free = $total_available - $lmfeature_in_use;
  $lmfeature_ok = $lmfeature_free - $keep; 

  ###########################################################################
  # Make sure that at least one job is submitted.
  # This is to make sure that at least one job is submitted.
  # if the available license is less than what you are trying to keep free.
  ###########################################################################
  if ($firsttime)
  {
    if ($lmfeature_free <= $keep)
    {
      print "The number of free licenses is less than or equal to your keep license option.\n";
      print "No job is submitted.  Exiting....\n";
      print "Please lower your keep count option and try again.\n";
      exit(1);
    }
    $firsttime = 0;
  }


  if ($lmfeature_ok > 0)
  {
    system "$jobslist[0]";
    shift (@jobslist)
    $jobs_to_submit = @jobslist;
  }
  sleep 180;
}


################################################################################
#@outputarray = system('lmstat -f primetime', ) or die "Can't exec lmstat: $!";
#Use the `` to execute, but capture the output of the shell script.
################################################################################
sub lmfeaturecount {
  $lmfeature_in_use = 0;

  @outputarray = `lmstat -f $lmfeature`;
  $outputarraysize = @outputarray;

  for ($i=0; $i<$outputarraysize; $i++)
  {
    $_ = $outputarray[$i];
    if ($_ !~ / start /)
    {
      next;
    }
    $lmfeature_in_use = $lmfeature_in_use +1;
  }
  return $lmfeature_in_use;
}
