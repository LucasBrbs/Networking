//
//  Models.swift
//  Networking
//
//  Created by Lucas Barbosa de Oliveira on 10/08/22.
//

import Foundation

struct Session: Codable {
    var token: String
    var user: User
}

struct User: Codable{
    var id: UUID
    var name: String
    var email: String
    var avatar: String?
}
