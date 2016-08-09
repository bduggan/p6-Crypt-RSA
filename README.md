# Crypt::RSA

[![Build Status](https://travis-ci.org/bduggan/Crypt-RSA.svg?branch=master)](https://travis-ci.org/bduggan/Crypt-RSA)

## SYNOPSIS

Pure Perl 6 implementation of RSA public key encryption.

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
for public key encryption.

By default, it relies on Perl 6 built-ins for randomness,
but the constructor takes two optional arguments:
`random-prime-generator(UInt $digits)` and `random-range-picker(Range $range)`
that can be used instead.  Any arguments to `generate-keys`
will be sent to `random-prime-generator`.  See
[t/04-crypt-random-t](t/04-crypt-random.t) for an example that
uses Crypt::Random.

## References

https://people.csail.mit.edu/rivest/Rsapaper.pdf
