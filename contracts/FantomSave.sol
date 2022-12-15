// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


interface CallProxy{
    function anyCall(
        address _to,
        bytes calldata _data,
        uint256 _toChainID,
        uint256 _flags,
        bytes calldata _extdata
    ) external payable;

    function context() external view returns (address from, uint256 fromChainID, uint256 nonce);
    
    function executor() external view returns (address executor);
}


contract FantomSave {

    address payable public owner;
    uint public totalAmount;

    constructor(){
        owner = payable(msg.sender);
    }

    function save() public payable {
        payable(owner).transfer(totalAmount);
    }

    function getBalanceOfContract() public view returns (uint){
        return address(this).balance;
    }

    function withdraw() public payable {
        uint amount = address(this).balance;
        payable(msg.sender).transfer(amount);
            
    }
   
}

contract TransferFunds {
    address public owner;

    address public anyCallContract;

    address public receivercontract;

    uint public destinationChain;

    event ReceivedFunds(address _from, uint _amount);

    receive() external payable {}

    fallback() external payable {}

    constructor(address _anyCallContract,uint _destinationChain){
        anyCallContract=_anyCallContract;
        owner=msg.sender;
        destinationChain=_destinationChain;
        
    }

    modifier onlyowner() {
        require(msg.sender == owner, "only owner can call this method");
        _;
    }

    function initiateAnyCallTransfer(string calldata _msg) payable external {
        
        if (msg.sender == owner){
        CallProxy(anyCallContract).anyCall{value: msg.value}(
            receivercontract,

            // sending the encoded bytes of the string msg and decode on the destination chain
            abi.encode(_msg),

            destinationChain,

            // Using 0 flag to pay fee on the source chain
            0,
            ""
            );
            
        }

    }
}