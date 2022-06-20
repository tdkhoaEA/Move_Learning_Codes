address 0x42 {
    module MoveAndCopy {

        struct Coin has key, drop {
            value: u8
        }

        fun mvncp() {
            let s = Coin { value: 0 };
            let s1 = s;
            let s2 = s;
        }
    }

}