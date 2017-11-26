pragma solidity ^0.4.18;
import 'zeppelin-solidity/contracts/token/MintableToken.sol';
import 'zeppelin-solidity/contracts/token/PausableToken.sol';

contract PayPerPlayToken is MintableToken, PausableToken {
string public name = "PayPerPlay"; 
string public symbol = "PPP";
uint public decimals = 18;

}

