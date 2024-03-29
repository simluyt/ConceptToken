pragma solidity ^0.4.18;

/* Extended SafeMath Library */

library SafeMath {
    function add(uint a, uint b) internal pure returns (uint c) {
         c = a + b;
         require(c >= a);
    }
    function sub(uint a, uint b) internal pure returns (uint c) {
        require(b <= a);
         c = a - b;
    }
    function mul(uint a, uint b) internal pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function div(uint a, uint b) internal pure returns (uint c) {
          require(b > 0);
         c = a / b;
    }
    function mod(uint a, uint b) internal pure returns (uint c) {
        require(a > 0 && b > 0);
        c = a % b;
    }
    // Add divide without rest
    // Add sqrt, pow

}