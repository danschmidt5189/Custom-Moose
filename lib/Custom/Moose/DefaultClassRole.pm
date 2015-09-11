package Custom::Moose::DefaultClassRole;
use Moose::Role;

sub list_repo_urls {
    my $self = shift;
    return
        map { $_->repo_url ? ($_->name => $_->repo_url) : () }
        grep { $_->does('Custom::Moose::DefaultMetaAttributeRole') }
        $self->meta->get_all_attributes;
}

1;
