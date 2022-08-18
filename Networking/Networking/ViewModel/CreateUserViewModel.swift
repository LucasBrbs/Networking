//
//  CreateAccountViewModel.swift
//  Networking
//
//  Created by Lucas Barbosa de Oliveira on 17/08/22.
//

import Foundation

class CreateUserViewModel: ObservableObject {
    
    
    @Published var createUserModel: CreateUsersModel?

    @MainActor
    func verifedUser(userEmail: CreateUsersModel) {
        self.createUserModel = userEmail
    }
}
