#!/usr/bin/perl
use strict;
use warnings;

# Read the content of the file into an array
my $filename = 'solar.txt';
open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";
my @lines = <$fh>;
close $fh;

# Task 1: Print records without a discoverer in the eighth field
print "1. Records without a discoverer:\n";
foreach my $line (@lines) {
    my @fields = split ' ', $line;
    if (!defined $fields[7] || $fields[7] eq '-') {
        print $line;
    }
}
print "\n";

# Task 2: Print every record omitting the second field
print "2. Records without the second field:\n";
foreach my $line (@lines) {
    my @fields = split ' ', $line;
    splice @fields, 1, 1;  # Remove the second field
    print join(' ', @fields), "\n";
}
print "\n";

# Task 3: Print records with negative orbital periods
print "3. Records with negative orbital periods:\n";
foreach my $line (@lines) {
    my @fields = split ' ', $line;
    if ($fields[4] < 0) {
        print $line;
    }
}
print "\n";

# Task 4: Print data for objects discovered by Voyager2
print "4. Objects discovered by Voyager2:\n";
foreach my $line (@lines) {
    my @fields = split ' ', $line;
    if ($fields[7] eq 'Voyager2') {
        print $line;
    }
}
print "\n";

# Task 5: Print each record with the orbital period in seconds
print "5. Records with orbital period in seconds:\n";
foreach my $line (@lines) {
    my @fields = split ' ', $line;
    my $period_in_seconds = $fields[4] * 24 * 60 * 60;  # Convert days to seconds
    $fields[4] = $period_in_seconds;
    print join(' ', @fields), "\n";
}