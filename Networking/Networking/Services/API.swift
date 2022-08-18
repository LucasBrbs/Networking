//
//  API.swift
//

import Foundation

class API {

    static func getAllPosts() async -> [NetPost] {
        let urlRequest = URLRequest(url: URL(string: "http://adaspace.local/posts")!) //configuração da requisição
            do {
                let (data, _) = try await URLSession.shared.data(for: urlRequest) //ativação da requisição web
                let netPostDecoded = try JSONDecoder().decode([NetPost].self, from: data) //JSON -> para classe, data é o JSON
                return netPostDecoded
            } catch {
//                print(error)
            }
            return []
    }

    static func login(username: String, password: String) async -> Session? { //parametro de entrada
           let login: String = "\(username):\(password)"
           let logindata = login.data(using: String.Encoding.utf8)!
           let base64 = logindata.base64EncodedString()  //transforma tudo que ta pegando em utf8 e vai codificar
           
        let url = "http://adaspace.local/users/login"
           var request = URLRequest (url: URL(string: url )!)
           request.httpMethod = "POST"
   //        request.allHTTPHeaderFields = ["accept": "application/json"]
           request.setValue("Basic \(base64)", forHTTPHeaderField: "Authorization")
           
           do {
               let (data, response) = try await URLSession.shared.data(for: request)
               print((response as! HTTPURLResponse).statusCode)
               print(String(data: data, encoding: .utf8)!)
               let session = try JSONDecoder().decode(Session.self, from: data)
               return session
               
           }
           catch {
               
           }
           return nil
       }
    
    static func createUser (user: CreateUsersModel) {
            
            var urlRequest = URLRequest(url: URL(string: "http://adaspace.local/users")!) //faz a requisição da URL por meio da URL
            urlRequest.httpMethod = "POST"
            urlRequest.allHTTPHeaderFields = [
                "Content-Type": "application/json"
            ]
            
            do {
                let user = CreateUsersModel(name: user.name, email: user.email, password: user.password) //pegando o modelo do CreateUsersModel 
                let encoder = JSONEncoder()
                urlRequest.httpBody = try encoder.encode(user) //codificar os parametros passados
                let session = URLSession.shared
                
                let dataTask = session.dataTask(with: urlRequest) {data, response, error in //retorno: recebendo os dados enviados
                    guard let data = data, let response = response as? HTTPURLResponse, error == nil
                    else {
                        print("error", error ?? URLError(.badServerResponse))
                        return
                    }
                    
                    guard (200 ... 299) ~= response.statusCode else {
                        print("Não cadastrou, erro =  \(response)")
                        return
                    }
                    
                    guard (500 ... 599) ~= response.statusCode else {
                        print("Cadastrou, status =  \(response.statusCode)")
                        print("data =  \(data)")
                        return
                    }
                }
                dataTask.resume()

            } catch {
                print(error)
            }
        }
}

