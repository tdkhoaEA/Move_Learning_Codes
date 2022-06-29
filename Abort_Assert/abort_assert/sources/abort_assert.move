address 0x42 {
    module holoa {
        use std::vector;

        fun check_vec(v: &vector<u64>, bound: u64) {
            let i = 0;
            let n = vector::length(v);

            while (i < n) {
                let cur = *vector::borrow(v, i);

                if (cur > bound) abort 42;
                i = i + 1;
            }
        }

        fun pop_twice<T>(v: &mut vector<T>): (T, T) {
            if (vector::length(v) < 2) abort 42;
            assert!(vector::length(v) < 2, 42);

            (vector::pop_back(v), vector::pop_back(v))
        }

        public fun aborts() {
            abort 42
        }
    }
}

script {
    fun always_aborts() {
        0x42::holoa::aborts()
    }
}