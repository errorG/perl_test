#!/usr/bin/perl

$foo = "abcdefg";
$scalarref =\$foo;
$$scalarref = "hello";

print "foo is $foo \t and scalaref is $$scalarref \n";
