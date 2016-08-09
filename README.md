# Crypt::RSA

[![Build Status](https://travis-ci.org/bduggan/Crypt-RSA.svg?branch=master)](https://travis-ci.org/bduggan/Crypt-RSA)

## SYNOPSIS

Pure Perl 6 implementation of the RSA encryption algorithm.

```

my $crypt = Crypt::RSA.new;
my ($public,$private) = $crypt.generate-keys;

my $message = 123456789;
my $encrypted = $crypt.encrypt($message);
my $decrypted = $crypt.decrypt($encrypted);

my $message = 123456789;
my $signature = $crypt.generate-signature($message);
die unless $crypt.verify-signature($message,$signature);

```

## DESCRIPTION

This is a very simplistic implementation of the RSA algorithm
as described here:

    https://people.csail.mit.edu/rivest/Rsapaper.pdf

By default it uses the Perl built-in random number functions,
but the constructor takes two optional arguments:
random-prime-generator and random-range-picker, which
can be used instead.  See [t/crypt-random-t](t/crypt-random.t)
for an example that uses Crypt::Random.

