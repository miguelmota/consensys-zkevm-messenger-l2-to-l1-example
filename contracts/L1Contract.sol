//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./IL1Bridge.sol";

contract L1Contract {
    string private greeting;
    address l2Contract;
    address l1Bridge;

    constructor(address _l2Contract, address _l1Bridge) {
      l2Contract = _l2Contract;
      l1Bridge = _l1Bridge;
    }

    function greet() public view returns (string memory) {
        return greeting;
    }

    function setGreeting(string memory _greeting) public {
        IBridge bridge = IBridge(l1Bridge);
        address sender = bridge.sender();
        require(sender == l2Contract);
        greeting = _greeting;
    }
}
