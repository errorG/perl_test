#!/usr/bin/perl

&useage if ($#ARGV != 3);
($first, $last, $base_line, $prj) = @ARGV;

$file_in = "log_in.txt";
$file_out = "log_out.txt";

unlink "$file_in";
unlink "$file_out";

system "touch",$file_in;
system "touch",$file_out;

system "svn log -r $first:$last $base_line > log_in.txt";


open FILE_IN,"$file_in";
open FILE_OUT,">>$file_out";

select FILE_OUT;
$~ = "WRITEFORMAT";

while(<FILE_IN>){
	chomp;
	
	if(/^r(\d*)\s*?\|\s(.*?)\s\|/){
		$svn = $1;
		$name = $2;
	}
	
	#if(/^\[((All)|(.*?$prj.*?))\](.*$)/){
	if(/^\[(.*?)\](.*$)/){
		$prj_name = $1;
		$svnlog = $2;
		#$svnlog = "abcdefghfkakfdkfjkafdajfjaklfjklajfkljakljfkladjlfjalf";
	}
	
	if($svnlog ne ""){
		#print  $prj_name,"\t",$svn,"\t",$name,"\t",$svnlog,"\n";
		write;
		$svn = '';
		$name = '';
		$svnlog = '';
	}
}

select STDOUT;

close FILE_IN;
close FILE_OUT;

format FILE_OUT_TOP = 
project   svn          name               log 
===========================================================================
.

format WRITEFORMAT = 
~@<<<<<<<<@######.##   @<<<<<<<<<<<<<<<<<<<@*
$prj_name,$svn,$name,$svnlog
---------------------------------------------------------------------------
.

sub useage
{
print "***********************************************************
The svnlog about 13095 project which No. between 3520 and 3538
./log.pl 3520 3538 http://192.168.3.193/svn/msm8926/BRANCH/MSM8926.LA.1.0.0.1.14_DEV_ROM 13095
***********************************************************\n\n"
}

