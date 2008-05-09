
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME             => 'Set::Files',
	VERSION	         => '1.04',
	($] >= 5.005
	? (ABSTRACT=>'routines to work with files, each definining a single set',
	   AUTHOR  =>'Sullivan Beck (sbeck@cpan.org)')
	: ()),
	'dist' => {COMPRESS=>'gzip',SUFFIX=>'gz'},
        PL_FILES  => {},
	PREREQ_PM => {
		'Carp'                => '0',
		'IO::File'            => '0',
		'Test::More'          => '0',
		'Test::Pod'           => '0',
		'Test::Pod::Coverage' => '0',
	},
);
