//
//  PopToRootCoordinator.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 21.02.2022..
//

import Foundation

class PopToRootCoordinator: ObservableObject {
    
    var popToRoot: EmptyCallback
    
    init(popToRoot: @escaping EmptyCallback) {
        self.popToRoot = popToRoot
    }
}
