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
############################################################################################################
#use strict;
use Env;
use Getopt::Long;

###################################
# Initialize the command arguments
###################################
$lmfeature = "";
$keep = -1;
$batchfile = "";

$username = "$ENV{USER}\n";
chomp($username);

$firsttime = 1;

GetOptions("h!" => \$h, "lmfeature:s" => \$lmfeature, "keep:i" => \$keep, "batchfile:s" => \$batchfile);

if ($h) {
  print "\n";
  print "USAGE: \n";
  print "       lmsub.pl -lmfeature  \"expr\" -keep \"num\" -batchfile \"filename\"\n";
  print "\n";
  print "       <-lmfeature> - Feature name of license in lmstat\n";
  print "       <-keep num>  - Number of licenses to save for others. num must be >=0 \n";
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
  print "\n    -lmfeature switch must be used.  Try lmsub.pl -h for help.\n\n";
  exit(1);
}

if (!$batchfile) {
  print "\n    -batchfile switch must be used.  Try lmsub.pl -h for help.\n\n";
  exit(1);
}

if (!$keep) {
  print "\n    -keep switch must be used.  Try lmsub.pl -h for help.\n\n";
  exit(1);
}

##################################################
# Make sure that the keep variable is either >= 0
##################################################
if ($keep < 0) {
  print "\n    -keep switch 's num must be >= 0.  Try lmsub.pl -h for help.\n\n";
  exit(1);
}


@jobslist = ();
$batchjobcount = 0;
################################################################################
# Read in a batch file, containing all of the jobs that need to be submitted.
################################################################################
#while (<>)
#{
#  chomp;
#  $jobslist[$batchjobcount] = $_;
#  $batchjobcount++;
#}

($in_use_count, $my_count, $total_count) = lmfeaturecount();
print "WAWA feature count in use : $in_use_count\n";
print "WAWA feature count total  : $total_count\n";
print "WAWA feature my count     : $my_count\n";
print "WAWA User is : $username\n";

################################################################################
#@outputarray = system('lmstat -f primetime', ) or die "Can't exec lmstat: $!";
#Use the `` to execute, but capture the output of the shell script.
################################################################################
$lmfeature_in_use = 0;

########################################################################
# Call license server with the specified feature, and redirect to a file
########################################################################
@outputarray = system("lmstat -f $lmfeature > lmstat.txt");
open (LMSTAT, "<lmstat.txt") or die "Error: Can't open file lmstat.txt: $!";

while (<LMSTAT>)
{
  if ($_ =~ /Total of /)
  {
    @linearray1 = split(':', $_);
    @linearray2 = split(" ", $linearray1[1]);
    $lmfeature_total = $linearray2[2];
    next;
  }

  if ($_ =~ /\-\-\-\-\-\-\-\-\-\-\-\-\-\-/)
  {
    last;
  }


  if ($_ =~ /Error getting feature/)
  {
    print "No such lmfeature \"$lmfeature\" exists. Please check the spelling and\/or\n"; 
    print "check your license server setup that carries an active $lmfeature license\n";
    exit(1);
  }

  if ($_ =~ /, start /)
  {
    $lmfeature_in_use = $lmfeature_in_use + 1;
    next;
  }
}

close (LMSTAT);

print "available for use: $lmfeature_total\n";
print "feature in use: $lmfeature_in_use\n";


###########################################
#re-initialize the no. of licenses in use.
###########################################
#$lmfeature_in_use = 0;

#print "Total license = $lmfeature_total\n";
#print "Total license in use = $lmfeature_in_use\n";

#################################################################################
# Check to see if any active license is available to run the requested batch job
#################################################################################
#if ($lmfeature_total == 0)
#{
#  print "Cannot submit job, as there are no licenses available\n";
#  print "Please check your license server setup that carries an active $lmfeature license\n";
#  exit(1);
#}



###################################
# Loop through and submit the jobs 
###################################
#FT $jobs_to_submit = @jobslist;


#FT while ($jobs_to_submit > 0)
while (<>)
{
  $lmfeature_in_use = lmfeaturecount();
print "feature in use: $lmfeature_in_use\n";
  #$lmfeature_free = $lmfeature_total - $lmfeature_in_use;
  #$lmfeature_ok = $lmfeature_free - $keep; 

  ###########################################################################
  # Make sure that at least one job is submitted.
  # This is to make sure that at least one job is submitted.
  # if the available license is less than what you are trying to keep free.
  ###########################################################################
  #if ($firsttime)
  #{
  #  if ($lmfeature_free <= $keep)
  #  {
  #    print "The number of free licenses is less than or equal to your keep license option.\n";
  #    print "No job is submitted.  Exiting....\n";
  #    print "Please lower your keep count option and try again.\n";
  #    exit(1);
  #  }
  #  $firsttime = 0;
  #}


  #if ($lmfeature_ok > 0)
  #{
  #  system "$jobslist[0]";
  #  shift (@jobslist)
  #  #$jobs_to_submit = @jobslist;
  #}
  sleep 30;
}


#---------------------------------- SUBROUTINE ----------------------------------
#--------------------------------------------------------------------------------
################################################################################
#@outputarray = system('lmstat -f primetime', ) or die "Can't exec lmstat: $!";
#Use the `` to execute, but capture the output of the shell script.
################################################################################
sub lmfeaturecount {
  my ($lmfeature_in_use);
  my ($lmfeature_total);
  my ($lmfeature_my_count);
  my (@outputarray);
  my (@linarray1);
  my (@linarray2);
  #my ($username);

  $lmfeature_in_use = 0;
  $lmfeature_total = 0;
  $lmfeature_my_count = 0;
  @outputarray = ();
  @linearray1 = ();
  @linearray2 = ();

  #$username = "$ENV{USER}\n";
  #chomp($username);

  ########################################################################
  # Call license server with the specified feature, and redirect to a file
  ########################################################################
  @outputarray = system("lmstat -f $lmfeature > lmstat.txt");
  open (LMSTAT, "<lmstat.txt") or die "Error: Can't open file lmstat.txt: $!";

  while (<LMSTAT>)
  {
    if ($_ =~ /Total of /)
    {
      @linearray1 = split(':', $_);
      @linearray2 = split(" ", $linearray1[1]);
      $lmfeature_total = $linearray2[2];
      next;
    }

    if ($_ =~ /\-\-\-\-\-\-\-\-\-\-\-\-\-\-/)
    {
      last;
    }

    if ($_ =~ /Error getting feature/)
    {
      print "No such lmfeature \"$lmfeature\" exists. Please check the spelling and\/or\n"; 
      print "check your license server setup that carries an active $lmfeature license\n";
      exit(1);
    }

    if ($_ =~ /, start /)
    {
      $lmfeature_in_use = $lmfeature_in_use + 1;

      if ($_ =~ /$username/)
      {
        $lmfeature_my_count = $lmfeature_my_count + 1;
      }
      next;
    }
  }
  close (LMSTAT);
  return ($lmfeature_in_use, $lmfeature_my_count, $lmfeature_total);
}
#---------------------------------- SUBROUTINE ----------------------------------
#--------------------------------------------------------------------------------






#
#  @outarray = system("lmstat -f $lmfeature > lmstat.txt");
#  #@outarray = `lmstat -f $lmfeature`;
#  $outarraysize = @outarray;
#
#  for ($i=0; $i<$outarraysize; $i++)
#  {
#    $_ = $outarray[$i];
#    if ($_ =~ /, start /)
#    {
#      $feature_in_use = $feature_in_use +1;
#      next;
#    }
#  }
#  return $feature_in_use;
#}
