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
        my $user_name;

        if (exists $log->{user}) {
            $user_name = $log->{user};
        }
        else {
            $user_name = 'guest';
        }

        if (exists $hash_temp{$user_name}) {
            push($hash_temp{$user_name}, $log);
        }
        else{
            $hash_temp{$user_name} = [$log];
        }
    }

    return \%hash_temp;
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
