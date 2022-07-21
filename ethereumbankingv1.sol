pragma solidity ^0.6.12;


contract mynewContract{
    address public owner;
    constructor () public{
        owner = msg.sender;
    }
    mapping(address => uint) public balance;
    receive() external payable{
        balance[msg.sender] = msg.value;
    }
    function widthdrawEth(address payable _to) public payable {
        uint _balance = balance[msg.sender];
        require(_balance > 0,'please add eth first');
        // _balance = _balance - balance[msg.sender];
        _to.transfer(_balance);
    }
}
