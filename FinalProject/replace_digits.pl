#!/usr/bin/perl
use strict;
use warnings;

# Define the mapping from digits to words
my %digit_to_word = (
    0 => 'zero',
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
);

# Open the input file for reading
open my $input_fh, '<', 'input.txt' or die "Cannot open input file: $!";

# Open the output file for writing
open my $output_fh, '>', 'output.txt' or die "Cannot open output file: $!";

# Process each line in the input file
while (my $line = <$input_fh>) {
    # Replace each digit with its word name
    $line =~ s/(\d)/$digit_to_word{$1}/g;

    # Write the modified line to the output file
    print $output_fh $line;
}

# Close the filehandles
close $input_fh;
close $output_fh;

print "Input file 'input.txt' contents:\n";
system("cat input.txt");

print "\nOutput file 'output.txt' contents:\n";
system("cat output.txt");