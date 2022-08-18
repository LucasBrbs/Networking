//
//  Models.swift
//  Networking
//
//  Created by Lucas Barbosa de Oliveira on 10/08/22.
//

import Foundation

struct arrayNetPost: Decodable {
    let netPost: [NetPost]
}

struct NetPost: Decodable, Identifiable {
    let id: String
    let user_id: String
    let like_count: Int
    let content: String
    let media: String?
}
