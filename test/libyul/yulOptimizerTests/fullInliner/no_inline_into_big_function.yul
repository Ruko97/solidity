{
    pop(memoryguard(0))
    function f(a) -> b {
        let x := mload(a)
        b := sload(x)
    }
    // This will not stop inlining with the new code transform in
    // the presence of above memoryguard.
    function g() -> x {
        x := f(f(f(f(f(f(f(f(f(f(f(f(f(f(f(f(f(f(f(2)))))))))))))))))))
    }
}
// ====
// EVMVersion: >homestead
// ----
// step: fullInliner
//
// {
//     { pop(memoryguard(0)) }
//     function f(a) -> b
//     { b := sload(mload(a)) }
//     function g() -> x_1
//     {
//         let a_21 := 2
//         let b_22 := 0
//         b_22 := sload(mload(a_21))
//         let a_24 := b_22
//         let b_25 := 0
//         b_25 := sload(mload(a_24))
//         let a_27 := b_25
//         let b_28 := 0
//         b_28 := sload(mload(a_27))
//         let a_30 := b_28
//         let b_31 := 0
//         b_31 := sload(mload(a_30))
//         let a_33 := b_31
//         let b_34 := 0
//         b_34 := sload(mload(a_33))
//         let a_36 := b_34
//         let b_37 := 0
//         b_37 := sload(mload(a_36))
//         let a_39 := b_37
//         let b_40 := 0
//         b_40 := sload(mload(a_39))
//         let a_42 := b_40
//         let b_43 := 0
//         b_43 := sload(mload(a_42))
//         let a_45 := b_43
//         let b_46 := 0
//         b_46 := sload(mload(a_45))
//         let a_48 := b_46
//         let b_49 := 0
//         b_49 := sload(mload(a_48))
//         let a_51 := b_49
//         let b_52 := 0
//         b_52 := sload(mload(a_51))
//         let a_54 := b_52
//         let b_55 := 0
//         b_55 := sload(mload(a_54))
//         let a_57 := b_55
//         let b_58 := 0
//         b_58 := sload(mload(a_57))
//         let a_60 := b_58
//         let b_61 := 0
//         b_61 := sload(mload(a_60))
//         let a_63 := b_61
//         let b_64 := 0
//         b_64 := sload(mload(a_63))
//         let a_66 := b_64
//         let b_67 := 0
//         b_67 := sload(mload(a_66))
//         let a_69 := b_67
//         let b_70 := 0
//         b_70 := sload(mload(a_69))
//         let a_72 := b_70
//         let b_73 := 0
//         b_73 := sload(mload(a_72))
//         let a_75 := b_73
//         let b_76 := 0
//         b_76 := sload(mload(a_75))
//         x_1 := b_76
//     }
// }
