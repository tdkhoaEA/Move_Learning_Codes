address 0xCAFE {
    module example {
        
        struct X has drop { f: u64 }
        struct Y has drop { x1: X, x2: X}

        fun new_x(): X {
            X { f: 1 }
        }

        #[test]
        fun example() {
            let y = Y { x1: new_x(), x2: new_x() };

            let Y { x1: X{ f }, x2 } = &y;

            assert!(*f + x2.f == 2, 0);

            let Y { x1: X{ f: f1 }, x2: X{ f: f2 } } = &mut y;
            *f1 = *f1 + 1;
            *f2 = *f2 + 1;
            assert!(*f1 + *f2 == 4, 1);
        }
    }
}