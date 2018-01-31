pragma solidity ^0.4.18;

import "./SafeMath.sol";

//Contract Approach

contract AbstractAllowanceToken {

    using SafeMath for uint256;

    mapping (address => mapping(address => uint256)) _allowances;

    modifier onlyAllowed();

    function transferFrom(address _from, address _to, address _value) public returns (bool success);
    function allowanceOf(address _tokenOwner, address _tokenSpender) public returns (uint256 allowance);
    function approve(address _tokenSpender, uint256 allowance) public returns (bool success);

}

contract AllowanceToken is BasicToken,AbstractAllowance {


    //Transaction
    function transferFrom(address _from, address _to, address _value) public returns (bool success) {
        require(_allowances[_from][_to] >= _value);
        require(_balances[_from] >= _value);
        _balances[_from].sub(_value);
        _balances[_to].add(_value);
        _allowances[_from][_to].sub(_value);
        return true;
    }

    //Call
    function allowanceOf(address _tokenOwner, address _tokenSpender) public constant returns (bool success) {
        return _allowances[_tokenOwner][_tokenSpender];
    }

    // Transaction
    function setAllowance(address _tokenSpender, uint256 allowance) public returns (bool success) {
        require(_balances[msg.sender] >= allowance);
        _allowances[msg.sender][_tokenSpender] = allowance;
        //Event?
    }


}