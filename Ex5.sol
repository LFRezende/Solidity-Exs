// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Desenvolva um contrato que:
    1 - Possua uma estrutura chamada "client", que contenha:
        1.1 - Nome do cliente
        1.2 - Idade
        1.3 - Wallet
    2 - Possua uma função de cadastro "pushClient()", em que cada cliente é colocado em uma lista dessas estruturas
    3 - Forneça um método para retornar em qual índice do vetor encontra-se o cliente ao inserir-se o nome no contrato para busca.
    3 - Possua uma função chamada "checkClient()", que retorna TRUE ou FALSE para dizer se o cliente está cadastrado.
    A pesquisa é dada pelo nome.
    4*/
contract Ex5 {
    // Criação da estrutura
    struct client {
        string client_name;
        uint256 client_age;
        address wallet;
    }

    client[] public list_of_clients; // Criando a lsita de clientes
    mapping(string => uint256) public client_to_index; // Obtenção do indice do cliente pelo nome.

    function pushClient(
        string memory _name,
        uint256 _age,
        address _wallet
    ) public {
        client memory new_client = client(_name, _age, _wallet);
        list_of_clients.push(new_client);
    }

    // Checando se o cliente está presente na listagem.
    function checkClient1(
        string memory _client_name
    ) public view returns (bool) {
        /* Maneira 2 - Mais concisa, pouco custosa e mais elegante*/
        if (client_to_index[_client_name] > 0) {
            // Se o mapeamento retorna um indice maior que zero, então o mapeamento foi feito.
            // Como o mapeamento é feito quando você insere alguem na lista, então ele está na lista.
            return true;
        } else {
            // O mapeamento pode devolver zero, e ter alguém no indice zero.
            // Se houver alguém no indice zero, então o comprimento da lista é 1.
            // OU seja, se maior que zero, então tem alguém ali.
            if (list_of_clients.length > 0) return true;
        }
        // Se nenhum dos casos ocorre, então não há ninguém com esse nome ali.
        return false;
    }
}
