# Copyright 2026 Google LLC
use strict;
use warnings;
use PDL;
use PDL::ML::Token::Tokenisers;

# 1. Construct a BPE tokenizer (or pass a tokenizer.json path on @ARGV)
my $tok;
if (defined $ARGV[0]) {
    $tok = PDL::ML::Token::Tokenisers->from_file($ARGV[0]);
} else {
    $tok = PDL::ML::Token::Tokenisers->new(
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
            'pdl'   => 10,
        },
        merges => [ 'h e', 'l l', 'he ll', 'hell o' ],
    );
}

printf "Vocab size: %d\n", $tok->vocab_size;

# 2. Encode text into a 1-D PDL long ndarray of token IDs
my $ids = $tok->encode('hello pdl world');
printf "Encoded %d tokens: %s\n", $ids->nelem, $ids;

# 3. Decode token IDs back to text
my $decoded = $tok->decode($ids);
print 'Decoded: ', $decoded, "\n";
