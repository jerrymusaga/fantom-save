// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract FantomSave {
    address payable public contractOwner;
    uint public totalAmount; 
    uint public savedFunds;

    event ReceivedFunds(address _from, uint _amount);

    constructor(){
        contractOwner == msg.sender;
        savedFunds = 0 ether;
    }

    function amountToSave(uint amount) public {
        require(amount > 0, 'Cannot deposit amount less than or equals 0');
        totalAmount = amount;
    }

    function getAmountToSave() public view returns (uint) {
        return totalAmount;
    }

    function save() public payable {
        contractOwner.transfer(msg.value);
    }

    receive() external payable {
        savedFunds = msg.value;
        contractOwner.transfer(savedFunds);
        totalAmount += savedFunds;
        emit ReceivedFunds(msg.sender, msg.value);
    }
   
}