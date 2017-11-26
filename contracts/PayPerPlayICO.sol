pragma solidity ^0.4.18;

import './PayPerPlayToken.sol';
import 'zeppelin-solidity/contracts/crowdsale/Crowdsale.sol';
import 'zeppelin-solidity/contracts/crowdsale/FinalizableCrowdsale.sol';
import 'zeppelin-solidity/contracts/crowdsale/CappedCrowdsale.sol';
import 'zeppelin-solidity/contracts/ownership/Ownable.sol';



contract PayPerPlayICO is Crowdsale, Ownable, CappedCrowdsale, FinalizableCrowdsale {

 uint256 public constant TOTAL_SHARE = 100;
 uint256 public constant CROWDSALE_SHARE = 60;
 uint256 public constant FOUNDATION_SHARE = 40;
 bool public ended = false;

  function PayPerPlayICO(uint256 _startTime, uint256 _endTime, uint256 _rate, address _wallet) 
    Crowdsale(_startTime, _endTime, _rate, _wallet)
    CappedCrowdsale(1400000000 ether) 
    FinalizableCrowdsale() {  
    	PayPerPlayToken(token).pause();
        
  }

  // creates the token to be sold.
  // override this method to have crowdsale of a specific MintableToken token.
  function createTokenContract() internal returns (MintableToken) {
    return new PayPerPlayToken();
  }

  function finalization() internal {
   uint256 totalSupply = token.totalSupply();
   uint256 finalSupply = TOTAL_SHARE.mul(totalSupply).div(CROWDSALE_SHARE);

   token.mint(wallet, FOUNDATION_SHARE.mul(finalSupply).div(TOTAL_SHARE));

   token.transferOwnership(owner);
  }

  function hasEnded() public constant returns (bool) {
   return ended || super.hasEnded();
  }

  function finalize() onlyOwner public {
   ended = true;
   super.finalize();
  }

}