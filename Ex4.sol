// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

/* Crie um contrato que:
    1 - Consiga verificar o número de decimais de precisão do token DAI
    2 - Retorne o preço do token DAI em dólares da rede da Goerli, com o número correto de casas decimais */

contract Ex4{
    address goerliDAIUSD = 0x0d79df66BE487753B02D015Fb622DED7f0E9798d;

    AggregatorV3Interface priceFeed = AggregatorV3Interface(goerliDAIUSD);

    function getPrice() public view returns (uint256) {
        (, int price, , ,) = priceFeed.latestRoundData();
        // O preço é retornado com 8 casas decimais... Precisamos multiplicar para retornar com 18 casas decimais.
        return uint256(price*10**10);
    }

    function convertETHDAI(uint256 _amountETH) public view returns (uint256){
        uint256 DAIamount = (_amountETH*getPrice())/10
    }

}
