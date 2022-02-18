//
//  SignupViewModel.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 18.02.2022..
//

import Foundation
import Combine

final class SignupViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var repeatedPassword = ""
    @Published var arePasswordsMathing = true
    @Published var externalSignupSheet: ExternalAccountType?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    deinit {
        print("bye")
    }
}

// MARK: - Interaction
extension SignupViewModel {
    
    func closeExternalSignupSheet() {
        externalSignupSheet = nil
    }
    
    func openExternalSignupSheet(_ type: ExternalAccountType) {
        externalSignupSheet = type
    }
}

private extension SignupViewModel {
    
    func setupSubscribers() {
        $password
            .combineLatest($repeatedPassword)
            .sink { [weak self] password, repeatedPassword in
                self?.arePasswordsMathing = password == repeatedPassword
            }
            .store(in: &cancellables)
    }
}
