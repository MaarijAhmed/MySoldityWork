// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";


contract MyNewToken is ERC20{
    address admin;
    constructor()ERC20('MY TOKEN','MAR'){
        _mint(msg.sender, 10000 * 10 **18);
        admin = msg.sender;
    }
    function mint(address _to, uint _ammount) external{
        require(msg.sender == admin,'only admin can call');
        _mint(_to,_ammount);
    }
    function burn(uint _ammount) external{
        _burn(msg.sender,_ammount);
    }

}
