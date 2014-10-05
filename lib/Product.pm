package Product;
use 5.008005;
use strict;
use warnings;

our $VERSION = "0.01";

sub validate{
 my $arg = shift;

 return "date" if $arg =~ /(\d+):(\d+):(\d+)/;
 return "int" if $arg =~ /[0-9]+/;
 return "str" if $arg =~ /\w+/;

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

