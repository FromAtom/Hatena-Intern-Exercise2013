package Parser;
use strict;
use warnings;

use Log;

sub new {
    my ($class, %args) = @_;
    return bless \%args, $class;
}

sub parse {
    my $self = shift;

    open my $fh, '<', $self->{filename}
        or die "Cannot open '$self': $!";

    my @lines = <$fh>;
    my @logs;

    for my $line (@lines) {
        push(@logs, parse_line($line));
    }

    return [@logs];
}

sub to_hash {
}

sub parse_line {
    my ($line) = @_;

    my %hash_temp;


    my @elements = split (/\t/, $line);
    chomp(@elements);

    for my $element (@elements) {
        my @values = split (/:/, $element,2);

        if ($values[1] ne '-') {
            $hash_temp{$values[0]} = $values[1];
        }
    }

    my $log = Log->new(%hash_temp);

    return $log;
}

1;
