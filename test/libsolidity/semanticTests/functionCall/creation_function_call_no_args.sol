contract C {
    uint public i;
    constructor() {
        i = 2;
    }
}
contract D {
    function f() public returns (uint r) {
        return new C().i();
    }
}
// ----
// f() -> 2
// gas legacy: 76585
// gas legacy code: 23600
