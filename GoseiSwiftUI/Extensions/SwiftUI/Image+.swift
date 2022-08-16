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
        case icon_x_lightGray
        case logo_visa
    }
    
    enum SchemedAsset {
        case logo_gosei
        case logo_apple
        case icon_avatar
        case icon_arrow_left
        case icon_home
        case icon_search
        case icon_wishlist
        case icon_cart
        case icon_heart
        case icon_heart_filled
        case icon_checkmark
        case icon_credit_card
        case icon_truck
        case icon_x
        case icon_slash
        
        case ilustration_checkout_successful
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
