//
//  Image+.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 16.02.2022..
//

import Foundation
import SwiftUI
import Fusion

extension Image {
    
    enum Asset {
        case logo_facebook
        case logo_google
    }
    
    enum SchemedAsset {
        case logo_gosei
        case logo_apple
        case icon_avatar
        case icon_arrow_left
        case icon_tab_home
        case icon_tab_search
        case icon_tab_wishlist
        case icon_tab_cart
    }
}

extension Image {
    
    @Inject fileprivate static var persistenceService: PersistenceServiceProtocol
    
    init(_ asset: Image.Asset) {
        self.init("\(asset)")
    }
    
    init(_ asset: Image.SchemedAsset) {
        let isLightMode = Self.persistenceService.colorScheme == .light
        self.init("\(asset)\(isLightMode ? "" : "_dark")")
    }
    
    init(_ asset: Image.SchemedAsset, scheme: PersistenceData.ColorScheme) {
        self.init("\(asset)_\(scheme)")
    }
}
