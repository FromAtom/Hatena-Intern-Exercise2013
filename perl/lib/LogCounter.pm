package LogCounter;
use strict;
use warnings;
use Log;

sub new {
    my ($class, $logs) = @_;
    return bless { logs => $logs }, $class;
};

sub group_by_user {
}

sub count_error {
    my $self = shift;
    my @logs = @{$self->{logs}};
    my $error_counter = 0;

    for my $log (@logs) {
        if ($log->{status} =~ /^5/) {
            $error_counter++;
        }
    }

    return $error_counter;
}

1;
