
use Module::Build;

my $build = Module::Build->new(
	license            => 'perl',
	dist_version       => '1.04',
	dist_author        => 'Sullivan Beck <sbeck@cpan.org>',
	module_name        => 'Set::Files',
	dist_abstract      => 'routines to work with files, each definining a single set',
	requires           => {
		'perl'                => '5.6.0',
		'Carp'                => '0',
		'IO::File'            => '0',
	},
	build_requires     => {
		'Test::More'          => '0',
	},
	build_recommends   => {
		'Test::Pod'           => '0',
		'Test::Pod::Coverage' => '0',
	},
	sign               => 1,
);

$build->create_build_script;
