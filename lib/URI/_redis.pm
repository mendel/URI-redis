package URI::_redis;
 
use strict;
use warnings;

our $VERSION = '0.01';
 
use base qw( URI::_login );

sub host {
    my $self = shift;

    return $self->SUPER::host(@_) || 'localhost';
}

sub default_port { 6379 }

sub database {
    my $self = shift;

    return $self->database_from_path || $self->database_from_query || 0;
}

sub database_from_path {
    my $self = shift;

    my ($database) = $self->path =~ m{ ^ / (\d+) $ }x;

    return $database;
}
 
sub database_from_query {
    my $self = shift;

    return { $self->query_form }->{db};
}
 
sub password {
    my $self = shift;

    return $self->password_from_userinfo || $self->password_from_query;
}
 
sub password_from_userinfo {
    my $self = shift;

    my $userinfo = $self->userinfo
        or return;

    my ($password) = $userinfo =~ m{ ^ .* : ([^@]+) }x;

    return $password;
}
 
sub password_from_query {
    my $self = shift;

    return { $self->query_form }->{password};
}

sub socket_path {
    my $self = shift;

    return $self->path;
}

1;
