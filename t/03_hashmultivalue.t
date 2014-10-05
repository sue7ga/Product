use strict;
use Test::More;

use Hash::MultiValue;
use Product;

my $hash = Hash::MultiValue->new(
  foo => "2014:02:22",
  bar => "8888:88:88",
  hoge => 288,
  biz => "aiue",
);

use Data::Dumper;

if(not Product::validate($hash->get('biz'))){
  $hash->remove('biz');
}

print Dumper $hash;

done_testing;