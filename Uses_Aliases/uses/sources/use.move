address 0x42 {
    module example {

        use std::vector::empty as empty_vec;

        fun new_vecs(): (vector<u8>, vector<u8>, vector<u8>) {
            let v1 = std::vector::empty();
            let v2 = vector::empty();
            let v3 = V::empty();
            (v1, v2, v3)
        }

        fun new_vecss(): (vector<u8>, vector<u8>, vector<u8>) {
            let v1 = std::vector::empty();
            let v2 = empty();
            let v3 = empty_vec();
            (v1, v2, v3)
        }

        use std::vector::{push_back, pop_back};

        fun swap_last_two<T>(v: &mut vector<T>) {
            assert!(len(v) >= 2, 42);
            let last = pop_back(v);
            let second_to_last = pop_back(v);
            push_back(v, last);
            push_back(v, second_to_last);
        }

        use std::vector::{
            Self,
            Self as V,
            length as len,
            empty,
        };
    }

    module data {
        struct S {}
        const FLAG: bool = false;
        fun foo() {}
    }
    module ex {
        use 0x42::data::{
            S as S,
            FLAG as FLag,
            foo as Foo,
            foo as bar,
        };
    }
    module yes {
        use std::vector::{empty, push_back};

        fun example(): vector<u8> {
            empty()
        }
    }
}