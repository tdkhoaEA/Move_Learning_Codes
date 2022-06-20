address 0x42 {
    module scope {

        use std::vector;

        fun scope() {
            let x = 0;
            x = x + 1;
            
            assert!(x == 1, 42);
            {
                x = x + 1;
                assert!(x == 2, 42);
            };
            assert!(x == 2, 42);

            {let v = vector::empty<u8>(); vector::push_back(&mut v, 1); v};
            
            let my_vector: vector<vector<u8>> = {
                let v = vector::empty<vector<u8>>();

                vector::push_back(&mut v, b"hello");
                vector::push_back(&mut v, b"goodbye");
                v
            };
        }

        struct Coin has store, drop { value: u64 }

        fun unused_resource(): Coin {
            let x = Coin { value: 0 };
            x.value = 1;

            let x = Coin { value: 10 };
            x
        }

        fun ction() {
            let x = 0;
            {
                let x = b"hello";
                assert!(x == b"hello", 1);
            };
            assert!(x == 0, 0);
        }
    }
}