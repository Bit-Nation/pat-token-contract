# PAT Token Smart Contract: API

This document defines and API of PAT Token Smart Contract.

## 1. Constructor

### Signature

    function PATToken (address _centralBank)

### Description

Deploy smart contract with given central bank address.

### Use Cases

* Administration:Deploy

## 2. Methods

### 2.1. name

#### Signature

    function name () pure returns (string result)

#### Description

Return name of the token.
May be called by anybody.
Does not accept ether.

#### Use Cases

* ERC-20:Name

### 2.2. symbol

#### Signature

    function symbol () pure returns (string result)

#### Description

Return symbol of the token.
May be called by anybody.
Does not accept ether.

#### Use Cases

* ERC-20:Symbol

### 2.3. decimals

#### Signature

    function decimals () pure returns (uint8 result)

#### Description

Return number of decimals for the token.
May be called by anybody.
Does not accept ether.

#### Use Cases

* ERC-20:Decimals

### 2.4. totalSupply

#### Signature

    function totalSupply ()
    constant returns (uint256 totalSupply)

#### Description

Return total number of tokens in circulation.
May be called by anybody.
Does not accept ether.
Defined by ERC-20.

#### Use Cases

* ERC-20:TotalSupply

### 2.5. balanceOf

#### Signature

    function balanceOf (address _owner)
    constant returns (uint256 balance)

Return number of tokens currently belonging to the owner of address _owner.
May be called by anybody.
Does not accept ether.
Defined by ERC-20.

#### Use Cases

* ERC-20:BalanceOf

### 2.6. transfer

#### Signature

    function transfer (address _to, uint356 _value)
    returns (bool success)

#### Description

Transfer _value tokens from message sender to the owner of address _to.
Returns true on success, false on error.
If this method returned false, it is guaranteed that state of the smart contract was not changed.
May be called by anybody.
Does not accept ether.
Defined by ERC-20.

#### Use Cases

* ERC-20:Transfer

### 2.7. transferFrom

#### Signature

    function transferFrom (address _from, address _to, uint256 _value)
    returns (bool success)

#### Description

Transfer _value tokens from the owner of address _from to the owner of address _to.
The transfer should be approved in advance by the owner of address _from.
Returns true on success, false on error.
If this method returned false, it is guaranteed that state of the smart contract was not changed.
May be called by anybody.
Does not accept ether.
Defined by ERC-20.

#### Use Cases

* ERC-20:TransferFrom

### 2.8. approve

#### Signature

    function approve (address _spender, uint256 _value)
    returns (bool success)

#### Description

Allow the owner of address _spender to transfer _value tokens from message sender.
Call to this method overrides any existing allowance of the owner of _spender address to transfer tokens belonging to message sender.
Returns true on success, false on error.
If this method returned false, it is guaranteed that state of the smart contract was not changed.
May be called by anybody.
Does not accept ether.
Defined by ERC-20.

#### Use Cases

* ERC-20:Approve

### 2.9. allowance

#### Signature

    function allowance (address _owner, address _spender)
    constant returns (uint256 remaining)

#### Description

Return number of tokens belonging to the owner of _owner address the owner of _spender address is currently allowed to transfer.
May be called by anybody.
Does not accept ether.
Defined by ERC-20.

#### Use Cases

* ERC-20:Allowance

## 3. Events

### 3.1. Transfer

#### Signature

    event Transfer (indexed address _from, indexed address _to, uint256 _value)

#### Description

Logged when _value tokens were transferred from the owner of address _from to the owner of address _to.

#### Use Cases

* ERC-20:Transfer
* ERC-20:TransferFrom

### 3.2. Approval

#### Signature

    event Approval (indexed address _owner, indexed address _spender, uint256 _value)

#### Description

Logged with owner of address _owner allowed the owner of address _spender to transfer _value of tokens belonging to the owner of address _owner.

#### Use Cases

* ERC-20:Approve
