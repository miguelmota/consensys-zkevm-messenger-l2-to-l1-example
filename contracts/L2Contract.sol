//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./IBridge.sol";

contract L2Contract {
    address l2Bridge;

    constructor(address _l2Bridge) {
      l2Bridge = _l2Bridge;
    }

    function sendMessageToL1(address _to, bytes memory _calldata, uint256 fee) payable public {
      uint256 deadline = 999999999999;

      IBridge bridge = IBridge(l2Bridge);
      bridge.dispatchMessage{value: msg.value}(
        _to,
        fee,
        deadline,
        _calldata
      );
    }
}
