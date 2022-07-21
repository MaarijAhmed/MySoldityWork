// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;


contract hotelbooking{
    mapping(address => statuses) public haveRoom;
    mapping(address => uint) public noRoomsBooked;
    
    enum statuses { vacant , Occupied}
    statuses currentStatus;
    address payable public owner;
    event Occupy(address _occupier, uint _ammount);
     constructor() public{
        owner = msg.sender;
        haveRoom[msg.sender] = statuses.vacant;
    }
    modifier checkFree{
        require(noRoomsBooked[msg.sender] >= 0,'room already booked');
        require(haveRoom[msg.sender] == statuses.vacant,'room already booked you can book one at a time');
        _;
    }
    modifier costs(uint _ammount){
        require(msg.value >= _ammount,'please keep your price up');
        _;
    }
    receive() external payable costs(0.01 ether) checkFree{
         
        currentStatus = statuses.Occupied;
        owner.transfer(msg.value);
        emit Occupy(msg.sender,msg.value);
        haveRoom[msg.sender] = statuses.Occupied;
        noRoomsBooked[msg.sender]++;
    }

    function checkIfHaveRoom() public view returns(statuses){
        return haveRoom[msg.sender];
    }
}
