address 0x42 {
    module hola {
        fun hola(x: u8) {
            if (x > 5) x = x - 5;
        }

        fun asdf(x: u8, y: &u8) {
            if (*y <= 10) y = y + 1 else y = 10
        }
    }
}