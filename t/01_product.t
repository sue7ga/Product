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
--- input: 2014:99:99
--- expected: 0
===
--- input: 204
--- expected: int
===
--- input: "hoge"
--- expected: str
