package URI::redis_Punix;
 
use strict;
use warnings;

our $VERSION = '0.01';
 
use base qw( URI::_redis );

sub database_from_path { undef }
sub host { undef }
sub port { undef }

1;
