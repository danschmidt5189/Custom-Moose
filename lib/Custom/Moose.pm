package Custom::Moose;

use Moose::Exporter;
use MooseX::AttributeShortcuts ();
use MooseX::HasDefaults::RO ();
use MooseX::StrictConstructor ();
use Custom::Moose::DefaultMetaAttributeRole ();
use Custom::Moose::DefaultClassRole ();

Moose::Exporter->setup_import_methods(
    also => [qw(
        Moose
        MooseX::AttributeShortcuts
        MooseX::HasDefaults::RO
        MooseX::StrictConstructor
    )],
    base_class_roles => [qw(Custom::Moose::DefaultClassRole)],
    class_metaroles => {
        attribute => [qw(Custom::Moose::DefaultMetaAttributeRole)],
    },
);

1;
