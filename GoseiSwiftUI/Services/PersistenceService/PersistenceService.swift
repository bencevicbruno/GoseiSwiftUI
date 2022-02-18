//
//  PersistenceService.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 16.02.2022..
//

import Foundation

final class PersistenceService: PersistenceServiceProtocol {
    
    var langauge: PersistenceData.Language? {
        get {
            return UserDefaults.load(key: .language)
        }
        set {
            UserDefaults.save(newValue, key: .language)
        }
    }
    
    var colorScheme: PersistenceData.ColorScheme {
        get {
            return UserDefaults.load(key: .color_scheme) ?? .light
        }
        set {
            UserDefaults.save(newValue, key: .color_scheme)
        }
    }
    
    var useLightMode: Bool {
        colorScheme == .light
    }
    
    var useDarkMode: Bool {
        colorScheme == .dark
    }
}

extension UserDefaults {
    
    static func load<T>(key: PersistenceData.Key) -> T? where T: Decodable {
        guard let data = UserDefaults.standard.object(forKey: key.rawValue) as? Data else { return nil }
        
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
    static func save<T>(_ t: T, key: PersistenceData.Key) where T: Encodable {
        guard let data = try? JSONEncoder().encode(t) else { return }
        
        UserDefaults.standard.set(data, forKey: key.rawValue)
    }
}
