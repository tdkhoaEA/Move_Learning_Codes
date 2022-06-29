address 0x42 {
    module sai {
        fun sum(n: u64): u64 {
            let sum = 0;
            let i = 1;
            while (i <= n) {
                sum = sum + 1;
                i = i + 1
            };

            sum
        }
    }
}