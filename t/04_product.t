use strict; 
use Test::More;
use Product;

my $date = "9999:99:22";

use Data::Dumper;
print Dumper Product::validate($date);

done_testing;

