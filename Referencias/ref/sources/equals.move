address 0x42 {
    module equals{

        struct S has copy, drop { f: u64, s: vector<u8> }
        struct Coin has store { value: u64 }

        fun always_true(): bool {
            let s = S { f: 0, s: b"" };

            assert!( copy s == s, 0);
            ( copy s ) == s
        }

        fun always_false(): bool {
            let s = S { f: 0, s: b"" };

            assert!( copy s != s, 1 );
            ( copy s ) != s
        }

        fun invalid( c1: Coin, c2: Coin) {
            &c1 == &c2;
        }
    }
}