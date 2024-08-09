#!/usr/bin/perl
use strict;
use warnings;

# Assuming 'Electricity.txt' is in the same directory as the script
my $filename = 'Electricity.txt';
open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";

my %word_count;
while (my $line = <$fh>) {
    chomp $line;
    my @words = split /\s+/, $line;
    foreach my $word (@words) {
        $word =~ s/[[:punct:]]//g; # Remove punctuation
        $word_count{lc $word}++;   # Count words case-insensitively
    }
}

# Sort and print words alphabetically ignoring case
print "Alphabetically:\n";
foreach my $word (sort keys %word_count) {
    printf "%-15s %s\n", $word, $word_count{$word};
}

# Sort and print words alphabetically with upper case words in front
print "\nAlphabetically with case:\n";
foreach my $word (sort { "\L$a" cmp "\L$b" || $a cmp $b } keys %word_count) {
    printf "%-15s %s\n", $word, $word_count{$word};
}

# Sort and print words by frequency
print "\nBy frequency (high to low):\n";
foreach my $word (sort { $word_count{$b} <=> $word_count{$a} } keys %word_count) {
    printf "%-15s %s\n", $word, $word_count{$word};
}

# Sort and print words by frequency with alphabetical order for words with the same frequency
print "\nBy frequency with alphabetical order for same frequency words:\n";
foreach my $word (sort { $word_count{$b} <=> $word_count{$a} || "\L$a" cmp "\L$b" } keys %word_count) {
    printf "%-15s %s\n", $word, $word_count{$word};
}

close $fh;