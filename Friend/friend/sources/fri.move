address 0x42 {
    module a {
        use 0x42::b;
        friend b;
    }

    module b {}
    
    module m {
    }
}