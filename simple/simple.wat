(module
    (func $i (import "imports" "print") (param i32))
    (func $add (param $x i32) (param $y i32) (result i32)
        (local $1 i32)
        local.get $x
        call $i
        local.get $y
        call $i

        local.get $x
        local.get $y
        i32.add
        local.set $1
        local.get $1
        call $i
        local.get $1
    )
    (export "add" (func $add))
)