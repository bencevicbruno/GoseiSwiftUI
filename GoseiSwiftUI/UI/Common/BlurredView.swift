//
//  BlurredView.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 16.02.2022..
//

import SwiftUI

struct BlurredView: UIViewRepresentable {
    
    typealias UIViewType = UIVisualEffectView
    
    let style: UIBlurEffect.Style
    
    init(_ style: UIBlurEffect.Style = .systemMaterial) {
        self.style = style
    }
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: self.style))
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.effect = UIBlurEffect(style: self.style)
    }
}
