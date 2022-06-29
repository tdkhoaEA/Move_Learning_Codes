address 0x42 {
    module m {
        /*struct Foo has copy, drop { x: u64, y: bool }
        struct Bar has drop {}
        struct Baz has drop { foo: Foo }

        fun hola() {
            let foo = Foo { x: 3, y: true };
            let bar = Baz { foo };

            let x_ref = &bar.foo.x;
        }

        fun hola2() {
            let foo = Foo {x: 3, y: false };
            let baz = Baz { foo: copy foo };
            let x: u64 = *&foo.x;
            let y: bool = *&foo.y;
            let foo2: Foo = *&baz.foo;
        }

        fun hola3() {
            let foo = Foo { x: 3, y: true };
            foo.x = 42;     // foo = Foo { x: 42, y: true }
            foo.y = !foo.y; // foo = Foo { x: 42, y: false }
            let bar = Bar { foo };            // bar = Bar { foo: Foo { x: 42, y: false } }
            bar.foo.x = 52;                   // bar = Bar { foo: Foo { x: 52, y: false } }
            bar.foo = Foo { x: 62, y: true }; // bar = Bar { foo: Foo { x: 62, y: true } }

            assert!(bar == bar, 0);
        }*/

    }
}