use strict;
use Test::More;
use Product;
use Encode 'encode';
use utf8;

subtest 'str validate' => sub{  
  ok(Product::validate("hoge","str"));
  ok(Product::validate("あいうえお","str"));
  ok(Product::validate("2014:04:23","str"));
  ok(Product::validate("1000000000","str"));
  ok(Product::validate("-1000","str"));
  ok(Product::validate("product124","str"));
  ok(Product::validate(2.5,"str"));
};

subtest 'int validate' => sub{
 ok(Product::validate(24,"int"));
 ok(Product::validate(22222,"int"));
 ok(Product::validate(-22222,"int"));
 ok(Product::validate(899999999999,"int"));
 ok(Product::validate(-899999999999,"int"));
 ok(not Product::validate(2.5,"int"));
 ok(not Product::validate("str","int"));
 ok(not Product::validate("2014:02:23","int"));
};

subtest 'date validate' => sub{
 ok(Product::validate("2014-02-22","date"));
 ok(Product::validate("2012/04/30","date")); 
 ok(Product::validate("2001-1-1","date")); 
 ok(not Product::validate("２０１２-04-30","date"));
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