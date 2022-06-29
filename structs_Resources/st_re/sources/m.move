address 0x2 {
    module m {
        struct Foo has drop { x: u64 }

        public fun new_foo(): Foo {
            Foo { x: 42 }
        }
    }

    module n {
        use 0x2::m;

        struct Wrapper has drop { foo: m::Foo }

        #[test]
        #[expected_failure]
        fun f1(foo: m::Foo) {
            let x = foo.x;
        }

        fun f2() {
            let foo_wrapper = Wrapper { foo: m::new_foo() };
        }
    }


    module mm {
        struct Foo { x: u64 }

        #[test]
        #[expected_failure]
        public fun copying_resource() {
            let foo = Foo { x: 100 };
            let foo_copy = copy foo;
            let foo_ref = &foo;
            let another_copy = *foo_ref;
        }

        #[test]
        #[expected_failure]
        public fun destroying_resource1() {
            let foo = Foo { x: 100 };
        }

        public fun destroying_resource1_fixed() {
            let foo = Foo { x: 100 };
            let Foo { x: _ } = foo;
        }

        #[test]
        #[expected_failure]
        public fun destroying_resource2(f: &mut Foo) {
            *f = Foo { x: 100 }; // this thing is gonna be destroyed lol
        }
    }









    module Coin {
        struct Coin has store { value: u64 }

        public fun mint(value: u64): Coin {
            Coin { value }
        }

        public fun withdraw(coin: &mut Coin, amount: u64): Coin {
            assert!(coin.value >= amount, 1000);
            coin.value = coin.value - amount;
            Coin { value: amount }
        }

        public fun deposit(coin: &mut Coin, other: Coin) {
            let Coin { value } = other;
            coin.value = coin.value + value;
        }

        public fun split(coin: Coin, amount: u64): (Coin, Coin) {
            let other: Coin = withdraw(&mut coin, amount);
            (coin, other)
        }

        public fun merge(coin1: Coin, coin2: Coin): Coin {
            deposit(&mut coin1, coin2);
            coin1
        }

        public fun destroy_zero(coin: Coin) {
            let Coin { value } = coin;
            assert!(value == 0, 1001);
        }
    }







    module point {
        struct Point has copy, drop, store {
            x: u64,
            y: u64,
        }

        public fun new(x: u64, y: u64): Point {
            Point {
                x,
                y,
            }
        }

        public fun x(p: &Point): u64 {
            p.x
        }

        public fun y(p: &Point): u64 {
            p.y
        }

        fun abs_sub(a: u64, b: u64): u64 {
            if (a < b) b - a
            else a - b
        }

        public fun dis_square(p1: &Point, p2: &Point): u64 {
            let dx = abs_sub(p1.x, p2.x);
            let dy = abs_sub(p1.y, p2.y);
            dx*dx + dy*dy
        }
    }

    module circule {
        use 0x2::Point::{Self, Point};

        struct Circle has copy, drop, store {
            center: Point,
            radius: u64,
        }

        public fun new(center: Point, radius: u64): Circle {
            Circle { center, radius }
        }

        public fun overlaps(c1: &Circle, c2: &Circle): bool {
            let d = Point::dis_square(&c1.center, &c2.center);
            c1.radius + c2.radius >= d
        }
    }
}