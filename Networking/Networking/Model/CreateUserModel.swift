//Modelo de criar o usuário

import Foundation

//Puxa as informações da API para criar o usuário -> tanto em Struct, como em Class
//A class precisaria de um inicializador
class CreateUsersModel: Codable {

    var name: String
    var email: String
    var password: String
    
    init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
}

//Criando o parametro do inicializador, é possível pegar os dados passados em outras partes do código

