#| Perl 6 implementation of RSA public key algorithm.
unit class Crypt::RSA;
use Crypt::RSA::Key;

has Crypt::RSA::Key $.public-key;
has Crypt::RSA::Key $.private-key;

method !random-prime(UInt:D :$digits) {
  repeat { $_ = (10**$digits .. (10**($digits+1))).pick } until .is-prime;
  return $_;
}

method encrypt(UInt $message) {
  return expmod($message,$!public-key.exponent,$!public-key.modulus)
}

method decrypt(UInt $message) {
  return expmod($message,$!private-key.exponent,$!private-key.modulus)
}

method generate-keys(UInt :$digits = 110) {
    my $q = self!random-prime(:$digits);
    my $p = self!random-prime(:$digits);
    my $pq = $p * $q;
    my $phi = ($p-1) * ($q-1);
    my $k;
    repeat {
      $k = (1..$pq).pick;
    } until $k gcd $phi == 1;

    my $inverse = expmod($k, -1, $phi);
    $!public-key = Crypt::RSA::Key.new(exponent => $k , modulus => $pq );
    $!private-key = Crypt::RSA::Key.new(exponent => $inverse, modulus => $pq );
    return ($!public-key, $!private-key);
}


