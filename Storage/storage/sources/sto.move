address 0x42 {
    module example {
        struct Container<T: store> has key { t: T }

        // Publish a Container storing a type T of the caller's choosing
        fun publish_generic_container<T: store>(account: &signer, t: T) {
            move_to<Container<T>>(account, Container { t })
        }

        /// Publish a container storing a u64
        fun publish_instantiated_generic_container(account: &signer, t: u64) {
            move_to<Container<u64>>(account, Container { t })
        }
    }
}