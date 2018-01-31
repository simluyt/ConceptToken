pragma solidity ^0.4.18;

/*
 * Basic Abstract Owned Contract 
 *
**/

contract AbstractOwned {
    address public owner;
    address public newOwner;

    event OwnershipTransfered(address _prevOwner, address _newOwner);
    event OwnershipAccepted(address _newOwner);

    modifier onlyOwner();
    modifier onlyNewOwner();

    function transferOwnership(address _newOwner) public;
    function acceptOwnership() public;
    
    //function rejectOwnership() public;
    //function revokeTransfer() public ;

}

/*
 * Owned Contract 
 *
**/

contract Owned is AbstractOwned {

    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }

    modifier onlyNewOwner(){
        require(msg.sender == newOwner);
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
        OwnershipTransfered(owner,newOwner);
    }

    function acceptOwnership() public onlyNewOwner {
        owner = msg.sender;
        newOwner = address(0);
        OwnershipAccepted(owner);
    }
}