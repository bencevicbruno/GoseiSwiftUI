//
//  LaunchView.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 16.02.2022..
//

import SwiftUI

struct LaunchView: View {
    
    @State private var isAnimating = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack {
                    topTriangle(geo)
                        .offset(x: 0, y: -triangleOffset)
                    
                    loadingView
                    
                    bottomTriangle(geo)
                        .offset(x: 0, y: triangleOffset)
                }
                
                Image(.logo_gosei)
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 50)
            }
            .onAppear {
                DispatchQueue.main.async {
                    withAnimation(.easeOut(duration: 0.5)) {
                        isAnimating = true
                    }
                }
            }
        }
        .background(Color.background)
        .ignoresSafeArea()
    }
}

private extension LaunchView {
    
    var triangleOffset: CGFloat {
        isAnimating ? 0 : UIScreen.main.bounds.width * 0.5
    }
    
    func topTriangle(_ geo: GeometryProxy) -> some View {
        HStack {
            RightTriangle(.topLeft)
                .fill(Color.goseiRed)
                .frame(size: triangleSize(geo))
            
            Spacer()
        }
    }
    
    var loadingView: some View {
        VStack {
            Spacer()
            
            Spacer()
            
            Spacer()
            
            LoadingIndicator(.constant(true))
                .frame(size: 40)
            
            Spacer()
        }
    }
    
    func bottomTriangle(_ geo: GeometryProxy) -> some View {
        HStack {
            Spacer()
            
            RightTriangle(.bottomRight)
                .fill(Color.goseiRed)
                .frame(size: triangleSize(geo))
        }
    }
    
    func triangleSize(_ geo: GeometryProxy) -> CGFloat {
        return geo.size.width * 11 / 24
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
