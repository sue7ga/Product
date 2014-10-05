use strict;
use Test::More;

use Hash::MultiValue;
use Product;

my $hash = Hash::MultiValue->new(
  foo => 'a',
  foo => 'b',
  bar => 'baz',
);

use Data::Dumper;
print Dumper $hash;



done_testing;