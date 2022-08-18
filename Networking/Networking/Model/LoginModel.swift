//Modelo de login

import Foundation

//Puxa o token e as informações dos Users da API
struct Session: Codable {
    var token: String
    var user: User
}

//Puxa as informações do usuário da API
struct User: Codable{
    var id: UUID
    var name: String
    var email: String
    var avatar: String?
}
