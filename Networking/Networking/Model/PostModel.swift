//modelo que puxa posts da API

import Foundation

//struct que chama a primeira informação da API -> o array de posts

//Decodable: método para conversão de dados, tipo JSON
struct arrayNetPost: Decodable {
    let netPost: [NetPost]
}

//Identifiable: protocolo usado para garantir formatos únicos, como UUID, como identificador de objetos
struct NetPost: Decodable, Identifiable {
    let id: String
    let user_id: String
    let like_count: Int
    let content: String
    let media: String?
}
