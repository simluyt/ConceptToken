pragma solidity ^0.4.18;

import "./SafeMath.sol";

/*
 * @title Basic Token Interface without allowance
 *
 */

contract AbstractBasicToken {

    using SafeMath for uint256;

    uint256 _totalSupply;
    mapping(address => uint256) _balances;


    function totalSupply() public returns (uint256 supply) ;
    function balanceOf(address _tokenOwner) public returns (uint256 balance);
    function transfer(address _to, uint256 value) public returns (bool success);

    //Events 
}

/*
 * @title Basic Token without allowance
 *
 */

contract BasicToken is AbstractBasicToken {

    function totalSupply() public returns (uint256 supply) {
        return _totalSupply;
    }

    function balanceOf(address _tokenOwner) public returns (uint256 balance) {
        return _balances[_tokenOwner];
    }

     function transfer(address _to,uint256 value) public returns (bool success) {
        _balances[msg.sender].sub(value);
        _balances[_to].add(value);
        return true; 
     }


}

