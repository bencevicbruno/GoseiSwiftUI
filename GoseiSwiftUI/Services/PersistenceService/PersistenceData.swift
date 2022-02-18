//
//  PersistenceData.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 16.02.2022..
//

import Foundation

enum PersistenceData {
    
    enum Key: String {
        case user
        case language
        case color_scheme
    }
    
    enum Language: String, Identifiable, CaseIterable, Codable {
        case english = "en"
        case croatian = "hr"
        
        var id: Self {
            self
        }
        
        var name: String {
            "\(self)".capitalized
        }
    }
    
    enum ColorScheme: Identifiable, CaseIterable, Codable {
        case light
        case dark
        
        var id: Self {
            self
        }
    }
}
