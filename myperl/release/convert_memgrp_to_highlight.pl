#!/usr/local/bin/perl

$groupname = "";
#$filename = $ARGV[0];
#$select = $ARGV[1];

#open (INFO, "<$filename") or die "Error: Can't open file $filename: $!";

while (<>)
{
  if ($_ =~ /RAM_GROUP/)
  {
    $select++;
    @linearray1 = split(" ", $_);
    $groupname = $linearray1[1];
    next;
  }

  if ($_ =~ / config /)
  {
    last;
  }

  if ($_ =~ /\{/)
  {
    next;
  }

  if ($_ =~ /\}/)
  {
    next;
  }

  $_ =~ s/, \(//g;
  $_ =~ s/, \(//g;
  $_ =~ s/ \)//g;
  $_ =~ s/\(//g;

  # ignore balnk lines
  if ($_ !~ /R/)
  {
    next;
  }

  $_ =~ s/sap6\.//g;
  $_ =~ s/\./\//g;

  @linearray = split (" ", $_);
  
  #print $_;
  print "ui layout highlight add search layout_0 Set$select $linearray[0]\/R\* glob cell\n";

}
