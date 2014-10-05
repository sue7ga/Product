package Product;
use 5.008005;
use strict;
use warnings;
use Time::Local 'timelocal';

our $VERSION = "0.01";

sub validate{
 my ($arg,$type) = @_;

 if($type eq "int"){
   return  $arg =~ /^[0-9]+$/;
 }elsif($type eq "date"){
  if($arg =~ /(\d+):(\d+):(\d+)/){
   return day_exist($1,$2,$3);
  }
 }elsif($type eq "str"){
   return $arg =~ /[a-zA-Z]+/;
 }

 return 0;
}

sub day_exist{
  my($year,$mon,$mday) = @_;

  $year -= 1900;
  $mon--;

  require Time::Local;
  eval{
    Time::Local::timelocal(0,0,0,$mday,$mon,$year);
  };

  return $@ ? 0 : 1;
}

1;


__END__

=encoding utf-8

=head1 NAME

Product - It's new $module

=head1 SYNOPSIS

    use Product;

=head1 DESCRIPTION

Product is ...

=head1 LICENSE

Copyright (C) sue7ga.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

sue7ga E<lt>sue77ga@gmail.comE<gt>

=cut

