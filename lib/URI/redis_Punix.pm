use strict;
use warnings;

package URI::redis_Punix;
 
use base qw( URI::redis );

sub host { undef }

sub port { undef }

sub socket_path {
    my $self = shift;

    return $self->path;
}

sub database_from_path { undef }

1;

__END__

=for Pod::Coverage host port socket_path database_from_path
