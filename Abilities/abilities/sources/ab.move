address 0x42 {
    module copy_example {
        struct NoAbilities {}
        struct S has copy, drop, store { f: bool }
        struct Cup<T> has copy, drop, store { item: T }

        fun example(c_x: Cup<u64>, c_s: Cup<S>) {
            let c_x2 = copy c_x;
            let c_s2 = copy c_s;
        }

    }

    module drop_example {
        struct NoAbilities {}
        struct S has copy, drop { f: bool }
        struct Cup<T> has copy, drop, store { item: T}

        fun unused() {
           Cup<bool> { item: true }; 
           Cup<S> { item: S { f: false }};
        }

        fun lef_in_local(c_account: Cup<signer>): u64 {
            let c_b = Cup<bool> { item: true };
            let c_s = Cup<S> { item: S { f: false }};
            0
        }

        fun invalid_unsed(): Cup<NoAbilities> {
            Cup<NoAbilities> { item: NoAbilities {}}
        }
    }

    module store_example {
        struct Cup<T> has copy, drop, store { item: T }
        struct My_Inner_Resource has store { yes: Cup<u64> }
    }

    module key_example {
        struct NoAbilities {}
        struct MyResouce<T> has key { f: T }

        fun valid(account: signer) acquires MyResouce {
            let addr = signer::address_of(account);

            let has_resource = exists<MyResouce<u64>>(addr);

            if (!has_resource) {
                move_to(account, MyResouce { f: 0 })
        };

        let r = borrow_global_mut<MyResouce<u64>>(addr);
        r.f = r.f + 1;
    }
}}