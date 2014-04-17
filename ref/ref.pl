#!/usr/bin/perl
use strict;
use warnings;

my @array = (1,2,3);
my $arref = \@array;

for(@$arref){
#	print "$_\n";
}

print ref $arref, "\n";
print "true \n" if(ref $arref);
