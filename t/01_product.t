use strict;
use Test::Base;
plan tests => 1*blocks;

use Product;
run{
 my $block = shift;
 my $output = Product::validate($block->input);
 is($output,$block->expected);
};

__DATA__

===
--- input: 2014:10:05
--- expected: date
===
--- input: 204
--- expected: int
===
--- input: "hoge"
--- expected: str
