//
//  ExternalAcountType.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 16.02.2022..
//

import Foundation
import SwiftUI

enum ExternalAccountType: String, Identifiable {
    case google = "Google"
    case facebook = "Facebook"
    case apple = "Apple"
    
    var id: Self {
        self
    }
    
    var logoImage: Image {
        switch(self) {
        case .google: return Image(.logo_google)
        case .facebook: return Image(.logo_facebook)
        case .apple: return Image(.logo_apple)
        }
    }
    
    var foregroundColor: Color {
        switch(self) {
        case .google: return .black
        case .facebook: return .white
        case .apple: return .white
        }
    }
    
    var backgroundColor: Color {
        switch(self) {
        case .google: return .white
        case .facebook: return .facebookBlue
        case .apple: return .black
        }
    }
}

