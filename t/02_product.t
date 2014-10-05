use strict;
use Test::More;
use Product;

subtest 'str validate' => sub{
  is(Product::validate("hoge","str"),1);
  ok(not Product::validate(24,"str"));
  ok(not Product::validate(2.5,"str"));
  ok(not Product::validate("2014:04:23","str"));
};

subtest 'int validate' => sub{
 is(Product::validate(24,"int"),1);
 is(Product::validate(22222,"int"),1);
 ok(not Product::validate(2.5,"int"));
 ok(not Product::validate("str","int"));
 ok(not Product::validate("2014:02:23","int"));
};

subtest 'date validate' => sub{
 is(Product::validate("2014:02:22","date"),1);
 is(Product::validate("2012:04:30","date"),1); 
 ok(not Product::validate(222,"date")); 
 ok(not Product::validate(2.5,"date")); 
 ok(not Product::validate("hoge","date")); 
};

done_testing;