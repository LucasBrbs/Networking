//
//  API.swift
//

import Foundation

class API {
        
    static func getAllPosts() async -> [NetPost] {
        var urlRequest = URLRequest(url: URL(string: "http://adaspace.local/posts")!)
            do {
                let (data, _) = try await URLSession.shared.data(for: urlRequest)
                let netPostDecoded = try JSONDecoder().decode([NetPost].self, from: data)
                return netPostDecoded
            } catch {
                print(error)
            }
            return []
    }
    
    static func login(username: String, password: String) async -> Session? {
           let login: String = "\(username):\(password)"
           let logindata = login.data(using: String.Encoding.utf8)!
           let base64 = logindata.base64EncodedString()
           
           
           var request = URLRequest (url: URL(string: "http://adaspace.local/users/login")!)
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
            
            var urlRequest = URLRequest(url: URL(string: "http://adaspace.local/users")!)
            urlRequest.httpMethod = "POST"
            urlRequest.allHTTPHeaderFields = [
                "Content-Type": "application/json"
            ]
            
            do {
                let user = CreateUsersModel(name: user.name, email: user.email, password: user.password)
                let encoder = JSONEncoder()
                urlRequest.httpBody = try encoder.encode(user)
                let session = URLSession.shared
                
                let dataTask = session.dataTask(with: urlRequest) {data, response, error in
                    guard
                        let data = data,
                        let response = response as? HTTPURLResponse,
                        error == nil
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
//    static func login() async ->[] {
//
//    }
    
//    static func getBreedsWithImage() async -> [CatBreed] {
//        var urlRequest = URLRequest(url: URL(string: "https://api.thecatapi.com/v1/breeds")!)
//        urlRequest.allHTTPHeaderFields = [
//            "x-api-key": "5cffc6c8-0e59-497e-a9ef-d1b266411e9c"
//        ]
//
//        do {
//            let (data, _) = try await URLSession.shared.data(for: urlRequest)
//            let catBreedsDecoded = try JSONDecoder().decode([CatBreed].self, from: data)
//            let catBreedsWithImage = catBreedsDecoded.filter { $0.image != nil && $0.image!.url != nil }
//            return catBreedsWithImage
//        } catch {
//            print(error)
//        }
//        return []
//    }
    
//    static func getFavourites() async -> [Favourite] {
//        var urlRequest = URLRequest(url: URL(string: "https://api.thecatapi.com/v1/favourites")!)
//        urlRequest.allHTTPHeaderFields = [
//            "x-api-key": "5cffc6c8-0e59-497e-a9ef-d1b266411e9c"
//        ]
//
//        do {
//            let (data, _) = try await URLSession.shared.data(for: urlRequest)
//            return try JSONDecoder().decode([Favourite].self, from: data)
//        } catch {
//            print(error)
//        }
//        return []
//    }
//
//    static func addFavourite(cat: CatBreed) async -> Bool {
//        guard let imageID = cat.image?.id else { return false }
//
//        var urlRequest = URLRequest(url: URL(string: "https://api.thecatapi.com/v1/favourites")!)
//        urlRequest.httpMethod = "POST"
//        urlRequest.allHTTPHeaderFields = [
//            "Content-Type": "application/json",
//            "x-api-key": "5cffc6c8-0e59-497e-a9ef-d1b266411e9c"
//        ]
//
//        do {
//            urlRequest.httpBody = try JSONEncoder().encode(Favourite(imageID: imageID, subID: "User-123"))
//            let (_, response) = try await URLSession.shared.data(for: urlRequest)
//            if let responseHeader = response as? HTTPURLResponse {
//                return (responseHeader.statusCode == 200)
//            }
//        } catch {
//            print(error)
//        }
//        return false
//    }
//
//    static func removeFavourite(_ favouriteID: Int) async -> Bool {
//        var components = URLComponents()
//        components.scheme = "https"
//        components.host = "api.thecatapi.com"
//        components.path = "/v1/favourites/\(favouriteID)"
//        let url = components.url!
//
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "DELETE"
//        urlRequest.allHTTPHeaderFields = [
//            "x-api-key": "5cffc6c8-0e59-497e-a9ef-d1b266411e9c"
//        ]
//
//        do {
//            let (_, response) = try await URLSession.shared.data(for: urlRequest)
//            if let responseHeader = response as? HTTPURLResponse {
//                return (responseHeader.statusCode == 200)
//            }
//        } catch {
//            print(error)
//        }
//        return false
//    }
}

