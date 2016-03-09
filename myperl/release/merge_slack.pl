#!/usr/local/bin/perl

$file1 = $ARGV[0];
$file2 = $ARGV[1];

open (S,"<$file1") or die "Error: Can't open file $file1: $!";
open (SLACK,"<$file2") or die "Error: Can't open file $file2: $!";

while (<S>)
{
 $endpoint = $_;
 @endpointarray = split (" ", $_);

 $slack = <SLACK>;
 chomp ($slack);
 chomp ($slack);
 @linearray = split (" ", $slack);

 print "$endpointarray[0] $linearray[1] $linearray[2]\n";

}
