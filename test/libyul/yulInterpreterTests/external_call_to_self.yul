{
	mstore(0x40, 0x42)

	if iszero(calldatasize()) {
		let x := call(gas(), address(), 0, 0x40, 0x20, 0x100, 0x20)
		sstore(0x64, calldataload(0))
		sstore(0x100, x)
		return(0x0, 0)
	}
	return(0x40, 0x20)
}
// ====
// simulateExternalCall: true
// ----
// Trace:
//   CALL(153, 0x11111111, 0, 64, 32, 256, 32)
//   RETURN(0, 0)
// Memory dump:
//     40: 0000000000000000000000000000000000000000000000000000000000000042
//    100: 0000000000000000000000000000000000000000000000000000000000000042
// Storage dump:
//   0000000000000000000000000000000000000000000000000000000000000100: 0000000000000000000000000000000000000000000000000000000000000001
