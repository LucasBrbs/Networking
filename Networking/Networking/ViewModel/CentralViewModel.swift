//
//  CentralController.swift
//  Networking
//
//  Created by Lucas Barbosa de Oliveira on 11/08/22.
//

import Foundation

class CentralViewModel: ObservableObject {
    
    @Published var netPost: [NetPost] = []
    
    @MainActor
    func publishPost(posts: [NetPost]) {
        self.netPost = posts
    }
}
