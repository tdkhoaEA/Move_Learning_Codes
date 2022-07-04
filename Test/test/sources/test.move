module 0xCAFE::a {

    #[test]
    #[expected_failure(abort_code = 1)]
    fun this_is_test() {let a = 0; assert!(a == 1, 1);}

    #[test]
    #[expected_failure]
    public fun this_will_fail_xddd() { abort 1}

    #[test]
    #[expected_failure]
    public fun error_and_pass() { let _a = 1/0;}

    #[test, expected_failure(abort_code = 2)]
    public fun mamalon() { abort 2 }
}

#[test_only]
module 0xCAFE::ABC {}
