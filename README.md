# PDL::ML::Token::Tokenisers

Pure-Perl BPE tokenizer and HuggingFace `tokenizer.json` loader for [PDL](https://pdl.perl.org/), encoding text directly into 1-D `long` PDL token-ID ndarrays.

## Installation

```bash
cpanm .
```

Or via ExtUtils::MakeMaker:

```bash
perl Makefile.PL
make
make test
make install
```

## Quickstart

```perl
use strict;
use warnings;
use PDL;
use PDL::ML::Token::Tokenisers;

my $tok = PDL::ML::Token::Tokenisers->new(
    vocab => {
        '<unk>' => 0,
        'h'     => 1,
        'e'     => 2,
        'l'     => 3,
        'o'     => 4,
        'he'    => 5,
        'll'    => 6,
        'hell'  => 7,
        'hello' => 8,
        'world' => 9,
    },
    merges => [ 'h e', 'l l', 'he ll', 'hell o' ],
);

my $ids = $tok->encode('hello world');
my $txt = $tok->decode($ids);
print 'IDs: ', $ids, ' | Decoded: ', $txt, "\n";

# Or load a HuggingFace tokenizer.json directly:
# my $hf = PDL::ML::Token::Tokenisers->from_file('tokenizer.json');
```

## Documentation & Examples

- Runnable tutorial: `perl examples/quickstart.pl` (see [`examples/quickstart.pl`](examples/quickstart.pl))
- Full POD documentation: `perldoc PDL::ML::Token::Tokenisers` (or [`lib/PDL/ML/Token/Tokenisers.pm`](lib/PDL/ML/Token/Tokenisers.pm))

## License

Copyright 2026 Google LLC. Licensed under the the same terms as Perl itself.
