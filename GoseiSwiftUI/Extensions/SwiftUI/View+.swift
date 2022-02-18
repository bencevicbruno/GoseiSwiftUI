//
//  View+.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 16.02.2022..
//

import SwiftUI

extension View {
    
    func frame(size: CGFloat) -> some View {
        self.frame(width: size, height: size)
    }
    
    func isHidden(_ isHidden: Bool) -> some View {
        self.opacity(isHidden ? 0 : 1)
    }
    
    func isVisible(_ isVisible: Bool) -> some View {
        self.opacity(isVisible ? 1 : 0)
    }
}

