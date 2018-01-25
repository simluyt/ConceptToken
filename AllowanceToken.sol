pragma solidity ^0.4.18;

import "./BasicToken.sol";

contract AbstractAllowanceToken is AbstractBasicToken {

    mapping(address => mapping(address => uint256)) _allowed;

    function allowanceOf(address _tokenOwner, address _tokenSpender) public returns (uint256 allowance);
    function requestAllowance(address _tokenOwner, address _tokenSpender, uint256 allowance) public returns (bool success);
    function approveAllowance(address _tokenSpender, uint allowance) public returns (bool success);
}