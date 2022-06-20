address 0x42 {
    module mas{

        struct X { f: u64 }

        fun new_x(): X{
            X { f: 1}
        }

        fun example() {
            let (x, _, _z) = (0, 1, 3);
            let (x, y, f, g);

            (X { f }, X {f: x}) = (new_x(), new_x());
            assert!(f + x == 2, 42);

            (x, y, _z, f, _, g) = (0, 0, 0, 0, 0, 0)
        }
    }
}