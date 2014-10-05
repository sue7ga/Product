use strict;

use Test::More;

use Product;

subtest 'Str' => sub{
 my @ok = ("hogehoge","migemo","hoge");
 my @not_ok = ("2014:10:28","25","8888:88:64");
 
subtest 'str_ok' => sub{
  for my $ok(@ok){
   is(Product::validate($ok),"str");
  } 
};

subtest 'str_notok' => sub{
  for my $not_ok(@not_ok){
    isnt(Product::validate($not_ok),"str");
  }
};

};

subtest 'Int' => sub{
 my @ok = (497,555,234);
 my @not_ok = ("2014:03:03","hoge","2014:99:00");

 subtest 'int_ok' => sub{
  for my $ok(@ok){
   is(Product::validate($ok),"int");
  }
 };

 subtest 'int_notok' => sub{
   for my $not_ok(@not_ok){
    isnt(Product::validate($not_ok),"int");
   }
 };

};

subtest 'Date' => sub{
 my @ok = ("2014:04:24","2013:02:23","2011:02:21");
 my @not_ok = ("hoge","migemo",204);

 subtest 'date_ok' => sub{
  for my $ok(@ok){
   is(Product::validate($ok),"date");
  }
 };

 subtest 'date_notok' => sub{
  for my $not_ok(@not_ok){
   isnt(Product::validate($not_ok),"date");
  }
 };
 
 my @validate_date   = ("2014:04:24","2013:01:22","2012:12:21","2015:04:25","9999:02:22");
 my @invalidate_date = ("2014:88:02","2014:02:88","8888:88:88");

 subtest 'validate_date' => sub{
   
  for my $validate_date(@validate_date){ 
   is(Product::validate($validate_date),"date");
  }
 
  for my $invalidate_date(@invalidate_date){
    is(Product::validate($invalidate_date),0);
  }
  
 };  

};

done_testing;