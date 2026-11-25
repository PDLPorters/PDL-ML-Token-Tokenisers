use 5.010;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME               => 'PDL::ML::Token::Tokenisers',
    AUTHOR             => q{C.J. Collier <cjac@google.com>},
    VERSION_FROM       => 'lib/PDL/ML/Token/Tokenisers.pm',
    ABSTRACT_FROM      => 'lib/PDL/ML/Token/Tokenisers.pm',
    LICENSE            => 'perl_5',
    MIN_PERL_VERSION   => '5.010',
    CONFIGURE_REQUIRES => { 'ExtUtils::MakeMaker' => '0' },
    TEST_REQUIRES      => { 'Test::More' => '0.88', 'File::Temp' => '0' },
    PREREQ_PM          => {
        'PDL'           => '2.080',
        'JSON::MaybeXS' => '0',
        'Carp'          => '0',
    },
    META_MERGE => {
        'meta-spec' => { version => 2 },
        resources   => {
            repository => {
                type => 'git',
                url  => 'https://github.com/PDLPorters/PDL-ML-Token-Tokenisers.git',
                web  => 'https://github.com/PDLPorters/PDL-ML-Token-Tokenisers',
            },
            bugtracker => {
                web => 'https://github.com/PDLPorters/PDL-ML-Token-Tokenisers/issues',
            },
        },
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz' },
    clean => { FILES => 'PDL-ML-Token-Tokenisers-*' },
);
