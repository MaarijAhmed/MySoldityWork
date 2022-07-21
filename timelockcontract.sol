// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;
import './token.sol';


contract timeLock{
    Token public token;
    address public recieverWallet;
    uint256 public releaseTime;
    constructor(Token _token, address payable _recieverWallet, uint256 _releaseTime) public{
        token = _token;
        recieverWallet = _recieverWallet;
        releaseTime = _releaseTime;
        require(block.timestamp >= _releaseTime, "please tell a valid time");
    }

    function relase() payable public{
        require(block.timestamp >= releaseTime);
        uint256 ammount = token.balanceOf(address(this));
        token.transfer(recieverWallet,ammount);
    }
}
