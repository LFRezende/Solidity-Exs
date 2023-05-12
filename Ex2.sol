/*Desenvolva um contrato que:
1. Transacione de uma wallet para outra.*/

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex2 {
    function send(address _wallet) public payable {
        payable(_wallet).call{value: address(this).balance}("");
    }
}
