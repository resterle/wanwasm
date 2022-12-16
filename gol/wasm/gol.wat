(module
    (memory (import "js" "mem") 100 100)
    (func $gol (param $l i32) (param $ll i32)
        (local $ptr i32)
        (local $mi i32)
        (local $i i32)
        (local $o i32)
        (local $c i32)
        (local $n i32)
        
        local.get $l
        i32.const 1
        i32.sub
        local.set $i

        local.get $l
        call $fm
        i32.const 4
        i32.sub
        local.set $mi

        local.get $mi
        local.get $mi 
        i32.add
        local.set $o

        (loop $all 
            local.get $mi
            i32.load
            local.set $c

            local.get $i
            local.get $l
            local.get $ll
            call $nei
            local.set $n

            local.get $c
            i32.const 0
            i32.eq
            (if 
                (then
                    i32.const 3 
                    local.get $n
                    i32.eq
                    (if 
                        (then 
                            local.get $o
                            i32.const 1
                            i32.store
                        )
                        ( else

                            local.get $o
                            i32.const 0
                            i32.store
                        )
                    )
                )

                ( else
                    local.get $n
                    i32.const 1
                    i32.gt_u
                    (if 
                        (then
                            local.get $n
                            i32.const 4
                            i32.lt_u
                            (if
                                (then
                                    local.get $o
                                    i32.const 1
                                    i32.store
                                )
                                (else
                                    local.get $o
                                    i32.const 0
                                    i32.store
                                )
                            )
                        )
                        (else
                            local.get $o
                            i32.const 0
                            i32.store
                        )
                    )
                )
            )

            local.get $o
            i32.const 4
            i32.sub
            local.set $o

            local.get $i
            i32.const 1
            i32.sub
            local.set $i

            local.get $mi
            i32.const 4
            i32.sub
            local.set $mi
            local.get $mi
            br_if $all
        )

        local.get $l
        local.get $ll
        call $cp 
    )

    (func $nei (param $i i32) (param $l i32) (param $ll i32) (result i32)
        (local $ab i32)
        (local $bl i32)
        (local $x i32)
        (local $y i32)
        (local $fr i32)
        (local $c i32)

        (local $t i32)

        (local $de i32)

        i32.const 0
        local.set $c

        local.get $i
        local.get $ll
        i32.sub
        local.set $ab

        local.get $i
        local.get $ll
        i32.add
        local.set $bl

        local.get $i
        local.get $ll
        i32.div_u
        local.set $y

        local.get $y
        local.get $ll
        i32.mul
        local.set $x

        local.get $i
        local.get $x
        i32.sub
        local.set $x

        local.get $x
        i32.const 1
        i32.add
        local.get $ll
        i32.sub
        local.set $fr

        local.get $fr
        i32.const 0
        i32.lt_s
        (if (then 
            local.get $i
            i32.const 1
            i32.add
            call $fm
            i32.load
            local.get $c
            i32.add
            local.set $c
        ))

        local.get $x
        i32.const 0
        i32.gt_u
        (if (then 
            local.get $i
            i32.const 1
            i32.sub
            call $fm
            i32.load
            local.get $c
            i32.add
            local.set $c
        ))

        local.get $i
        local.get $ll
        i32.ge_u
        (if
            (then 
                local.get $ab
                call $fm
                i32.load
                local.get $c
                i32.add
                local.set $c

                local.get $fr
                i32.const 0
                i32.lt_s
                (if (then 
                    local.get $ab
                    i32.const 1
                    i32.add
                    call $fm
                    i32.load
                    local.get $c
                    i32.add
                    local.set $c
                ))

                local.get $x
                i32.const 0
                i32.gt_u
                (if (then 
                    local.get $ab
                    i32.const 1
                    i32.sub
                    call $fm
                    i32.load
                    local.get $c
                    i32.add
                    local.set $c
                ))
            )
        )

        local.get $l
        local.get $i
        i32.sub
        local.get $ll
        i32.gt_u
        (if
            (then 
                local.get $bl
                call $fm
                i32.load
                local.get $c
                i32.add
                local.set $c

                local.get $fr
                i32.const 0
                i32.lt_s
                (if (then 
                    local.get $bl
                    i32.const 1
                    i32.add
                    call $fm
                    i32.load
                    local.get $c
                    i32.add
                    local.set $c
                ))

                local.get $x
                i32.const 0
                i32.gt_u
                (if (then 
                    local.get $bl
                    i32.const 1
                    i32.sub
                    call $fm
                    i32.load
                    local.get $c
                    i32.add
                    local.set $c
                ))
            )
        )

        local.get $c
    )

    (func $fm (param $i i32) (result i32)
        local.get $i
        i32.const 2
        i32.shl
    )

    (func $cp (param $l i32) (param $ll i32)
        (local $i i32)
        (local $o i32)
        (local $t i32)

        local.get $l
        call $fm
        i32.const 4
        i32.sub
        local.set $i

        local.get $i
        local.get $i 
        i32.add
        local.set $o

        (loop $all 
            local.get $o
            i32.load
            local.set $t
            local.get $i
            local.get $t
            i32.store

            local.get $o
            i32.const 4
            i32.sub
            local.set $o

            local.get $i
            i32.const 4
            i32.sub
            local.set $i
            local.get $i
            br_if $all
        )
    )

    (export "gol" (func $gol))
    (export "nei" (func $nei))
)