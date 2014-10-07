package Product;
use 5.008005;
use strict;
use warnings;
use Time::Local 'timelocal';
use DateTime;

our $VERSION = "0.01";

sub validate{
    my ($arg,$type) = @_;

    if ($type eq "int") {
        return  $arg =~ /^-?[0-9]+$/;
    } elsif ($type eq "date") {
        return _check_date($arg);
    } elsif ($type eq "str") {
        return $arg =~ /\w+/;
    }

    return 0;
}

sub _check_date {
    my ( $date, $obj ) = @_;

    return 1 unless $date;

    my ( $year, $month, $day ) = $date =~ m{^(\d+)[-/](\d+)[-/](\d+)$};
    my $datetime = eval {
        DateTime->new(year => $year, month => $month, day => $day, hour => 0, minute => 0, second => 0);
    };
    $$obj = $datetime if $obj;
 
  return $datetime ? 1 : 0;
}

sub day_exist{
  my ($year,$mon,$mday) = @_;

  require Time::Local;
  my $ret = eval{
    Time::Local::timelocal(0,0,0,$mday,$mon - 1,$year - 1900);
  };

  return $ret ? 0 : 1;
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

