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
    my @log;

    for my $line (@lines) {
        push(@log, parse_line($line));
        #この中に1行分のparse処理を書く
    }

#    my @splited_tab = split (/\t/, $line);
#    my $method_name = $splited_tab[0];
#    my @splited_tab2 = split (/:/, $method_name);


#    my @log = [$log];

    return @log;
}

sub parse_line {
    my ($line) = @_;

    my %hash_temp = (
        host    => '-',
        user    => '-',
        epoch   => '-',
        req     => '-',
        status  => '-',
        size    => '-',
        referer => '-',
    );

    my @elements = split (/\t/, $line);

    for my $element (@elements) {
        my @values = split (/:/, $element);

        if (exists $hash_temp{$values[0]}){
            $hash_temp{$values[0]} = $values[1];
        }
    }

    my $log = Log->new(%hash_temp);

    return $log;
}

1;
