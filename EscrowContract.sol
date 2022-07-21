// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;


contract Escrow{
    address public agent;
    mapping(address => uint256) public deposits;
    
    constructor() public{
        agent = msg.sender;
    }
    modifier onlyAgent{
        require(msg.sender == agent);
        _;
    }

    function deposit(address _payee) payable public{
        uint256 ammount = msg.value;
        deposits[_payee] = deposits[_payee] + ammount;
    }
    function widthdraw(address payable _address) onlyAgent public payable{
        uint256 payment = deposits[_address];
        deposits[_address] = 0;
        _address.transfer(payment);
    }
}
