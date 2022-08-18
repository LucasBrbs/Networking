//
//  CentralController.swift
//  Networking
//
//  Created by Lucas Barbosa de Oliveira on 11/08/22.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    
    @Published var session: Session?

    @MainActor
    func verifedUser(userToken: Session) {
        self.session = userToken
    }
}
