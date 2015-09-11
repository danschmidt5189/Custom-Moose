package TestClass;

use Custom::Moose;

has 'other', is => 'rw';
has 'moose',
    repo_url => 'https://github.com/moose/Moose',
    default => 'Moose';

package test;
use Test::Modern qw(:deep :deeper :fatal :more !TD);

my $CM = 'Custom::Moose';

my $obj = TestClass->new;

ok exception { TestClass->new(non_attr => '1') },
    '... Class acts like ::StrictConstructor';
ok $obj->does("${CM}::DefaultClassRole"),
    '... Object has its default role';
ok !exception { $obj->other('foo') },
    '... Object can change the "RW" attribute';
ok exception { $obj->moose('MooseX') },
    '... Object cannot change the "RO" attribute';
cmp_deeply { $obj->list_repo_urls }, {
    moose => 'https://github.com/moose/Moose',
},
    '... Object can return its repo_urls';

my $attr = $obj->meta->get_attribute('moose');
ok $attr->does("${CM}::DefaultMetaAttributeRole"),
    '... Attr has its default role';
is $attr->repo_url, 'https://github.com/moose/Moose',
    '... Attr has its repo_url attribute';

done_testing;
