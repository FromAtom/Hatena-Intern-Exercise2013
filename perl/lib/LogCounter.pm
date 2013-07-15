package LogCounter;
use strict;
use warnings;
use Log;

sub new {
    my ($class, $logs) = @_;
    return bless { logs => $logs }, $class;
};

sub group_by_user {
    my $self = shift;
    my @logs = @{$self->{logs}};
    my %hash_temp;

    for my $log (@logs) {
        if (exists $hash_temp{$log->{user}}) {
            if ($log->{user} eq '-') {
                push($hash_temp{'guest'}, $log);
            }
            else {
                push($hash_temp{$log->{user}}, $log);
            }
        }
        else{
            if ($log->{user} eq '-') {
                $hash_temp{'guest'} = [$log];
            }
            else {
                $hash_temp{$log->{user}} = [$log];
            }
        }
    }

    return \%hash_temp
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
