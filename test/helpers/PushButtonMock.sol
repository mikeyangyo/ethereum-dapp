pragma solidity ^0.5.0;

import '../../contracts/PushButton.sol';

// @dev PushButtonMock mocks current block number

contract PushButtonMock is PushButton {

  uint mock_blockNumber = 1;

  constructor() PushButton() public {

  }

  function getBlock() view public returns (uint) {
    return mock_blockNumber;
  }

  function setMockedBlockNumber(uint _b) public {
    mock_blockNumber = _b;
  }

}