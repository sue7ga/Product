use strict;
use Test::More;
use Product;
use Encode 'encode';
use utf8;

subtest 'str validate' => sub{  
  is(Product::validate("hoge","str"),1);
  is(Product::validate("あいうえお","str"),1);
  is(Product::validate("2014:04:23","str"),1);
  is(Product::validate("1000000000","str"),1);
  is(Product::validate("-1000","str"),1);
  is(Product::validate("product124","str"),1);
  is(Product::validate(2.5,"str"),1);
};

subtest 'int validate' => sub{
 is(Product::validate(24,"int"),1);
 is(Product::validate(22222,"int"),1);
 is(Product::validate(-22222,"int"),1);
 is(Product::validate(899999999999,"int"),1);
 is(Product::validate(-899999999999,"int"),1);
 ok(not Product::validate(2.5,"int"));
 ok(not Product::validate("str","int"));
 ok(not Product::validate("2014:02:23","int"));
};

subtest 'date validate' => sub{
 is(Product::validate("2014-02-22","date"),1);
 is(Product::validate("2012/04/30","date"),1); 
 is(Product::validate("2001-1-1","date"),1); 
 ok(not Product::validate("2001--1-1","date")); 
 ok(not Product::validate("2001/-1/1","date")); 
 ok(not Product::validate("2001/1/-3","date")); 
 ok(not Product::validate("2001:03:23","date")); 
 ok(not Product::validate(222,"date")); 
 ok(not Product::validate(2.5,"date")); 
 ok(not Product::validate(-2.5,"date")); 
 ok(not Product::validate(-222,"date")); 
 ok(not Product::validate("hoge","date")); 
};

done_testing;