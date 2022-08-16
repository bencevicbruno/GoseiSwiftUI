//
//  Color+.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 16.02.2022..
//

import Foundation
import SwiftUI
import Fusion

extension Color {
    
    static let goseiRed = Color(255, 39, 42)
    
    static let facebookBlue = Color(66, 103, 178)
    
    static let lightGray = Color(uiColor: UIColor.lightGray)
    static let gray241 = Color(241, 241, 241)
    static var gray21 = Color(21, 21, 21)
    
    static var background: Color {
        return lightMode ? .white : .black
    }
    
    static var backgroundAccent: Color {
        lightMode ? gray241 : gray21
    }
    
    static var text: Color {
        return lightMode ? .black : .white
    }
}

extension Color {
    @Inject fileprivate static var persistenceService: PersistenceServiceProtocol
    
    fileprivate static var lightMode: Bool {
        persistenceService.useLightMode
    }
    
    init(_ red: Int, _ green: Int, _ blue: Int) {
        self.init(red: Double(red) / 255.0, green: Double(green) / 255.0, blue: Double(blue) / 255.0)
    }
}
