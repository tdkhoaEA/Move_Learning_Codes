address 0x42 {
    module example {
        struct Foo has copy, drop { x: u8, y: bool }
        struct Bar has drop { foo: Foo }

        fun example() {
            let foo = Foo { x: 3, y: false };
            let foo_ref: &Foo = &foo;
            let y: bool = foo_ref.y;
            let x_ref: &u8 = &foo.x;

            let x_ref_mut: &mut u8 = &mut foo.x;
            *x_ref_mut = 42;
        }

        fun second_example() {
            let foo = Foo { x: 3, y: false };
            let bar = Bar { foo };
            let x_ref = &bar.foo.x;
        }

        fun third_example() {
            let foo = Foo { x: 3, y: false };
            let foo_ref: &Foo = &foo;
            let x_ref: &u8 = &foo_ref.x;
        }

        fun fourth_example() {
            let foo = Foo { x: 3, y: true };
            let bar = Bar { foo: copy foo };
            let x: u8 = *&foo.x;
            let y: bool = *&foo.y;
            let foo2: Foo = *&bar.foo;
        }

        fun fifth_example() {
            let foo = Foo { x: 3, y: true };
            let foo_ref = &mut foo;
            foo_ref.x = foo_ref.x + 1;
            assert!(foo.x == 4, 4);
        }

        


    }
}