package Log;
use strict;
use warnings;
use DateTime;

sub new {
    my ($class, %args) = @_;

    return bless \%args, $class;
}

sub protocol {
    my $self = shift;
    my @split_ref = split (/ /, $self->{req});
    my $protocol_name = $split_ref[2];
    return $protocol_name;
}

sub method {
    my $self = shift;
    my @split_ref = split (/ /, $self->{req});
    my $method_name = $split_ref[0];
    return $method_name;
}

sub path {
    my $self = shift;
    my @split_ref = split (/ /, $self->{req});
    my $path_name = $split_ref[1];
    return $path_name;
}

sub uri {
    my $self = shift;
    my $host = $self->{host};
    my @split_ref = split (/\s+/, $self->{req});
    my $path_name = $split_ref[1];
    return $host .  $path_name;
}

sub time {
    my $self = shift;
    my $time = $self->{epoch};
    my $test = DateTime->from_epoch( time_zone => 'Asia/Tokyo', epoch => $time);
    return $test;
}

1;
