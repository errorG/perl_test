package GYF;

require Exporter;

our @ISA = qw(Exporter);
our @EXPORT = qw(camel);
our @EXPORT_OK = qw($weight);
our $VERSION = 1.00;

sub camel { print "One-hump dromedary\n"}

$weight = 1024;

1;

