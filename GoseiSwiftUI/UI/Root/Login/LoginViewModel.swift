//
//  LoginViewModel.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 18.02.2022..
//

import Foundation
import SwiftUI
import Combine
import Fusion

final class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var areCredidentialsInvalid = false
    @Published var externalLoginSheet: ExternalAccountType?
    @Published var showingSignUp = false
    
    @Inject var persistenceService: PersistenceServiceProtocol
    
    func saveUserInfo() {
        let user = PersistenceData.User(name: "Bruno Benčević", email: "bencevic.bruno@gmail.com", address: nil, phoneNumber: nil, birthday: nil, avatarURL: URL(string: "https://juicebubble.co.za/wp-content/uploads/2018/03/pikachu-pink-square.png"))
        
        persistenceService.user = user
    }
}

// MARK: - Interaction
extension LoginViewModel {
    
    func openExternalLoginSheet(_ type: ExternalAccountType) {
        self.externalLoginSheet = type
    }
    
    func closeExternalLoginSheet() {
        self.externalLoginSheet = nil
    }
}

// MARK: - Navigation
extension LoginViewModel {
    
    func goToSignup() {
        self.showingSignUp = true
    }
}

