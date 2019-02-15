pragma solidity ^0.5.0;

contract PushButton {
    uint public startBlock;
    uint public interval = 108 * 60 / 4;
    uint public nextTimeoutBlock;
    uint public totalPush;
    string public title;

    event ButtonPushed(address indexed _adress, uint _totalPush, uint _nextTimeoutBlock);

    constructor() public {
        startBlock = block.number;
        nextTimeoutBlock = startBlock + interval;
        totalPush = 0;
    }

    function push() isTimeOut() public returns (bool) {
        totalPush += 1;
        nextTimeoutBlock = getBlock() + interval;
        checkTitle();
        emit ButtonPushed(msg.sender, totalPush, nextTimeoutBlock);
        return true;
    }

    modifier isTimeOut(){
        require(getBlock() <= nextTimeoutBlock);
        _;
    }

    function getBlock() view public returns (uint) {
        return block.number;
    }

    function checkTitle() internal {
        if (totalPush < 10) {
            title = "newbie";
        } else if (totalPush < 1000) {
            title = "apprentice";
        } else if (totalPush < 10000) {
            title = "master";
        } else {
            title = "believer";
        }
    }
}