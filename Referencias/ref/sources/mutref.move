address 0x42 {
module referencias {
   
    use std::vector;

    fun hola() {
        let x = 0;
        let y = 1;
        
        let cond: bool = true;
        let r = if (cond) &mut x else &mut y;
        *r = *r + 1;
        assert!(*r == 0, 1);
    }

    fun modificar_struct_vector() {
        let v = vector::empty();
        vector::push_back(&mut v, 100);
        assert!(*vector::borrow(&v, 0) == 100, 42);
    }
}
}