//
//  LoadingIndicator.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 16.02.2022..
//

import SwiftUI

struct LoadingIndicator: View {
    
    @Binding var isAnimating: Bool
    private var color: Color
    
    @State private var angle: Double = 0
    
    var body: some View {
        Image(systemName: "star.fill")
            .resizable()
            .foregroundColor(color)
            .rotationEffect(.degrees(angle))
            .onAppear {
                animate()
            }
            .onChange(of: isAnimating) { isAnimating in
                if isAnimating {
                    animate()
                }
            }
    }
    
    init(_ isAnimating: Binding<Bool>, color: Color = .goseiRed) {
        self._isAnimating = isAnimating
        self.color = color
    }
}

private extension LoadingIndicator {
    
    func animate() {
        guard isAnimating else { return }
        
        DispatchQueue.main.async {
            withAnimation(Animation.easeOut(duration: 0.5)) {
                angle -= 30
            }
            
            withAnimation(.easeOut(duration: 1.5).delay(0.5)) {
                angle += 360 + 30
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                animate()
            }
        }
    }
}

struct LoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicator(.constant(true))
            .frame(size: 60)
    }
}
