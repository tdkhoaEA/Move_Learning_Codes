address 0x42 {
    module example {

        struct Foo<T> has copy, drop { x: T }

        struct Bar<T1, T2> has copy, drop { x: T1, y: vector<T2>, }

        fun id<T>(x: T): T {
            (x: T)
        }

        fun foo() {
        }

        fun foos() {
            let foo = Foo<bool> { x: true };
            let Foo<bool> { x } = foo;
        }
    }



    module sip {

        struct S<T1, phantom T2: copy> has copy, drop { x: T1 }
        struct NoCopy has copy, drop{}
        struct HasCopy has copy, drop{}

        fun hola() {
            let s = S<HasCopy, NoCopy> {x: HasCopy{}};
        }
    }


    module nop {
        struct R {}

        #[test]
        #[expected_failure]
        fun unsafe_consume<T>(x: T) {}

        fun safer_consume<T: drop>(x: T) {}

        #[test]
        #[expected_failute]
        fun foo() {
            let r = R {};
            safer_consume<R> (r)
        }
    }

    module bueno_tal_vez {
        struct R has drop { x: u8 }

        fun hola(): R {
            let r = R { x: 8 };
            let r = R { x: 9 };
            r
        }
    }
}