//
//  ExternalAccountButton.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 18.02.2022..
//

import SwiftUI

struct ExternalAccountButton: View {
    
    private var type: ExternalAccountType
    private var onTapped: EmptyCallback?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .fill(Color.background)
            
            type.logoImage
                .resizable()
                .scaledToFit()
                .shadow(color: Color.text.opacity(0.2), radius: 5, x: 3, y: 3)
                .frame(size: 40 / 2)
        }
        .frame(size: 40)
        .shadow(color: Color.text.opacity(0.2), radius: 5, x: 3, y: 3)
        .onTapGesture {
            onTapped?()
        }
    }
    
    init(_ type: ExternalAccountType, onTapped: EmptyCallback? = nil) {
        self.type = type
        self.onTapped = onTapped
    }
}

struct ExternalAccountButton_Previews: PreviewProvider {
    static var previews: some View {
        ExternalAccountButton(.google)
    }
}
