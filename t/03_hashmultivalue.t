use strict;
use Test::More;
use Hash::MultiValue;
use Product;

use Data::Dumper;

subtest 'invalidate_date remove' => sub{
 my $hash = Hash::MultiValue->new(
   foo => "2014:02:22",
   bar => "8888:88:88",
   hoge => 288,
   biz => "aiue",
 );
 if(not Product::validate($hash->get('bar'))){
   $hash->remove('bar');
 }
};

subtest 'str remove' => sub{
 my $hash = Hash::MultiValue->new(
   foo => "2014:02:22",
   bar => "8888:88:88",
   hoge => 288,
   biz => "aiue",
 );
 if(Product::validate($hash->get('biz')) eq 'str'){
   $hash->remove('biz');
 }
 print Dumper $hash;
};

subtest 'int remove' => sub{
 my $hash = Hash::MultiValue->new(
   foo => "2014:02:22",
   bar => "8888:88:88",
   hoge => 288,
   biz => "aiue",
 );
 if(Product::validate($hash->get('hoge')) eq 'int'){
   $hash->remove('hoge');
 }
 print Dumper $hash;
};


subtest 'int remove' => sub{
 my $hash = Hash::MultiValue->new(
   foo => "2014:02:22",
   bar => "8888:88:88",
   hoge => 288,
   biz => "aiue",
 );
 if(Product::validate($hash->get('foo')) eq 'date'){
   $hash->remove('foo');
 }
 print Dumper $hash;
};


done_testing;
