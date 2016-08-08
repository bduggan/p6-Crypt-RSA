use v6;
use lib 'lib';
use Test;

use Crypt::RSA;

my $crypt = Crypt::RSA.new;

my ($pub,$pri) = $crypt.generate-keys;
isa-ok $pub, Crypt::RSA::Key, 'public key';
isa-ok $pri, Crypt::RSA::Key, 'private key';

for (1..100) -> $message {
    is $crypt.decrypt( $crypt.encrypt($message) ), $message, "roundtrip";
}

done-testing;

