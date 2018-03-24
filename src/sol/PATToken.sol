/*
 * PAT Token Smart Contract.  Copyright © 2017 by ABDK Consulting.
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */
pragma solidity ^0.4.16;

import "./AbstractToken.sol";

/**
 * PAT Token Smart Contract.
 */
contract PATToken is AbstractToken {
  uint256 constant internal TOKENS_COUNT = 42000000000e18;

  /**
   * Create PAT Token smart contract with given central bank address.
   *
   * @param _centralBank central bank address
   */
  function PATToken (address _centralBank)
    AbstractToken () {
    accounts [_centralBank] = TOKENS_COUNT; // Limit emission to 42G
  }

  /**
   * Get total number of tokens in circulation.
   *
   * @return total number of tokens in circulation
   */
  function totalSupply () constant returns (uint256 supply) {
    return TOKENS_COUNT;
  }

  /**
   * Get name of this token.
   *
   * @return name of this token
   */
  function name () public pure returns (string) {
    return "Pangea Arbitration Token";
  }

  /**
   * Get symbol of this token.
   *
   * @return symbol of this token
   */
  function symbol () public pure returns (string) {
    return "PAT";
  }

  /**
   * Get number of decimals for this token.
   *
   * @return number of decimals for this token
   */
  function decimals () public pure returns (uint8) {
    return 18;
  }
}
