use strict;
use warnings;

use Data::Dumper;
use Test::Differences;

use Parser;
use LogCounter;

my $parser = Parser->new( filename => 'log.ltsv' );
my $counter = LogCounter->new($parser->parse);
print 'total error size: ' . $counter->count_error . "\n";
print Dumper $counter->group_by_user;
