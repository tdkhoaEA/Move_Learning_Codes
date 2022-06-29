address 0x42 {
    module vector_example {

        use std::vector;

        struct Balance has key { value: u64 }
        struct Box<T> has key { items: vector<T> }

        public fun store_two<Item1: store, Item2: store>(
            addr: address,
            item1: Item1,
            item2: Item2 
        ) acquires Balance, Box {
            let balance = borrow_global_mut<Balance>(addr);
            balance.value = balance.value - 2;
            let box1 = borrow_global_mut<Box<Item1>>(addr);
            vector::push_back(&mut box1.items, item1);
            let box2 = borrow_global_mut<Box<Item2>>(addr);
            vector::push_back(&mut box2.items, item2);
        }


        public fun zero(): u64 { 0 }

        public fun id<T>(x: T): T { x }

        fun safe_sub(x: u64, y: u64): u64 {
            if (y > x) 0
            else x - y
        }

    }

}

script {
    use 0x42::vector_example::{Self, zero};
    fun call_zero() {
        0x42::vector_example::zero();
        vector_example::zero();
        zero();
    }


}