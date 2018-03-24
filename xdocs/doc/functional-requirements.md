# BPAT Token Smart Contract: Functional Requirements

This document summarizes functional requirements for PAT Token Smart
Contract.

## 0. Introduction

PAT Token Smart Contract is an [ERC-20](https://github.com/ethereum/EIPs/issues/20) compliant [Ethereum](https://ethereum.org) smart contract that manages PAT Tokens.
The following sections of this document describe functional requirements for PAT Token Smart Contract.

## 1. Use Cases

This sections describes use cases for PAT Token Smart Contract.
Related use cases are grouped into following functional.

### 1.1. ERC-20 Functional Block

This functional block contains use cases required by [ERC-20](https://github.com/ethereum/EIPs/issues/20) standard.

#### 1.1.1. ERC-20:Name ####

**Actors:** User, Smart Contract

**Goal:** User wants to know name of the token

##### Main Flow: #####

1. User calls constant method on Smart Contract (constant method means method that does not modify blockchain state, so such method may be called locally consuming zero gas)
2. Smart Contract returns name of the token to the User

#### 1.1.2. ERC-20:Symbol ####

**Actors:** User, Smart Contract

**Goal:** User wants to know symbol of the token

##### Main Flow: #####

1. User calls constant method on Smart Contract
2. Smart Contract returns symbol of the token to the User

#### 1.1.3. ERC-20:Decimals ####

**Actors:** User, Smart Contract

**Goal:** User wants to know how many tokens are currently in circulation

##### Main Flow: #####

1. User calls constant method on Smart Contract
2. Smart Contract returns number of decimals for the token to the User

#### 1.1.4. ERC-20:TotalSupply

**Actors**: *User*, *Smart Contract*

**Goal:** *User* wants to know how many tokens are currently in circulation

##### Main Flow:

1. *User* calls constant method on *Smart Contract*
2. *Smart Contract* returns to *User* total number of tokens in circulation

#### 1.1.5. ERC-20:BalanceOf

**Actors**: *User*, *Smart Contract*

**Goal:** *User* wants to know how many tokens are currently belonging to the owner of certain address

##### Main Flow:

1. *User* calls constant method on *Smart Contract* providing the following information as method parameters: address to get number of tokens currently belonging to the owner of
2. *Smart Contract* returns to *User* number of tokens currently belonging to the owner of given address

#### 1.1.6. ERC-20:Transfer

**Actors**: *User*, *Smart Contract*

**Goal**: *User* wants to transfer some of his tokens to the owner of certain address

##### Main Flow:

1. *User* calls method on *Smart Contract* providing the following information as method parameters: address to transfer tokens to the owner of and number of tokens to transfer
2. Token transfers are not currently frozen
3. There are enough tokens currently belonging to *User*
4. *Smart Contract* transfers requested number of tokens from *User* to the owner of given address
5. *Smart Contract* logs tokens transfer event with the following information: address tokens were transferred from the owner of, address tokens were transferred to the owner of, and number of tokens transferred
6. *Smart Contract* returns success indicator to *User*

##### Exceptional Flow #1:

1. Same as in Main Flow
2. Token transfers are currently frozen
3. *Smart Contract* returns error indicator to *User*

##### Exceptional Flow #2:

1. Same as in Main Flow
2. Same as in Main Flow
3. Same as in Main Flow
4. There is not enough tokens currently belonging to *User*
5. *Smart Contract* returns error indicator to *User*

#### 1.1.7. ERC-20:TransferFrom

**Actors**: *User*, *Smart Contract*

**Goal**: *User* wants to transfer some of the tokens currently belonging to the owner of certain source address to the owner of certain destination address

##### Main Flow:

1. *User* calls method on *Smart Contract* providing the following information as method parameters: source address, destination address, and number of tokens to transfer
2. Token transfers are not currently frozen
3. *User* is currently allowed to transfer requested number of tokens from the owner of source address
4. There are enough tokens currently belonging to the owner of source address
5. *Smart Contract* transfers requested number of tokens from the owner of source address to the owner of destination address
6. *Smart Contract* decreases by the number of tokens transferred the number of tokens *User* is allowed to transfer from the owner of source address
7. *Smart Contract* logs token transfer event with the following information: source address, destination address, and number of tokens transferred
8. *Smart Contract* returns success indicator to *User*

##### Exceptional Flow #1:

1. Same as in Main Flow
2. Token transfers are currently frozen
3. *Smart Contract* returns error indicator to *User*

##### Exceptional Flow #2:

1. Same as in Main Flow
2. Same as in Main Flow
3. *User* is not currently allowed to transfer requested number of tokens from the owner of source address
4. *Smart Contract* returns error indicator to *User*

##### Exceptional Flow #3:

1. Same as in Main Flow
2. Same as in Main Flow
3. Same as in Main Flow
4. Same as in Main Flow
5. There are not enough tokens currently belonging to the owner of source address
6. *Smart Contract* returns error indicator to *User*

#### 1.1.8. ERC-20:Approve

**Actors**: *User*, *Smart Contract*

**Goal**: *User* wants to set how many tokens belonging to *User* the owner of certain address is allowed to transfer

##### Main Flow:

1. *User* calls method on *Smart Contract* providing the following information as method parameters: address to allow the owner of to transfer tokens belonging to *User and number of tokens to allow transfer of
2. *Smart Contract* set the number of tokens belonging to *User* the owner of given address is allowed to transfer
3. *Smart Contract* logs token transfer approval event with the following information: *User*'s address, address the owner of was allowed to transfer tokens belonging to *User*, and number of tokens the transfer was allowed of
4. *Smart Contract* returns success indicator to *User*

#### 1.1.9. ERC-20:Allowance

**Actors**: *User*, *Smart Contract*

**Goal**: *User* wants to know how many tokens belonging to the owner of certain source address the owner of certain spender address is currently allowed to transfer

##### Main Flow:

1. *User* calls constant method on *Smart Contract* providing the following information as method parameters: source address and spender address
2. *Smart Contract* returns to *User* the number of tokens belonging to the owner of source address the owner of spender address is currently allowed to transfer

### 1.2. Administration Functional Block

This functional block contains use cases related to smart contract administration.

#### 1.2.1. Administration:Deploy

**Actors**: *User*, *Smart Contract*

**Goal**: *User* wants to deploy *Smart Contract* with certain central bank address

##### Main Flow:

1. *User* deploys *Smart Contract* providing the following information as constructor arguments: central bank address
2. *Smart Contract* remember given central bank address
3. *Smart Contract* creates 42000000000e18 tokens and gives them to central bank
