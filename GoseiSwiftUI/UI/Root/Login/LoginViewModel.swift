//
//  LoginViewModel.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 18.02.2022..
//

import Foundation
import SwiftUI
import Combine

final class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var areCredidentialsInvalid = false
    @Published var externalLoginSheet: ExternalAccountType?
    @Published var showingSignUp = false
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

