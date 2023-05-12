/* Desenvolva um contrato que:
    1. Construa uma lista de endereços;
    2. Diga em qual índice de endereços está localizada uma wallet.*/

/* Exemplo */
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex1 {
    address[] public wallets;
    mapping(address => uint256) public walletToIndex;

    function addWallet(address _wallet) public {
        walletToIndex[_wallet] = wallets.length;
        wallets.push(_wallet);
    }

    function getIndex(address _wallet) public view returns (uint256) {
        return walletToIndex[_wallet];
    }
}
