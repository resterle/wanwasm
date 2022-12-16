(module
    (memory $m 1)
    (func $add (param $x i32) (param $y i32)
        (local $t i32)
        local.get $x
        local.get $y
        i32.add
        local.set $t


        i32.const 0
        local.get $t
        i32.store
    )
    (export "add" (func $add))
    (export "result" (memory $m))
)