script {
    const MY_ERROR_CODE: u64 = 0;

    fun main(input: u64) {
        assert!(input > 0, MY_ERROR_CODE);
    }
}

address 0x42 {
    module example {
        const MY_ADDRESS: address = @0x42;

        public fun permissioned(s: &signer) {
            assert!(std::signer::address_of(s) == MY_ADDRESS, 0);
        }
    }
}