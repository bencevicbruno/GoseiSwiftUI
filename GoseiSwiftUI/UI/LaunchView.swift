//
//  LaunchView.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 16.02.2022..
//

import SwiftUI

struct LaunchView: View {
    
    @State private var trianglesOffset = 0.0
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack {
                    topTriangle(geo)
                        .offset(x: 0, y: -trianglesOffset)
                    
                    loadingView
                    
                    bottomTriangle(geo)
                        .offset(x: 0, y: trianglesOffset)
                }
                
                Image(.logo_gosei)
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 50)
            }
            .onAppear {
                trianglesOffset = triangleSize(geo)
                
                DispatchQueue.main.async {
                    withAnimation(Animation.easeOut(duration: 0.5)) {
                        trianglesOffset = 0.0
                    }
                }
            }
        }
        .background(Color.background)
        .ignoresSafeArea()
    }
}

private extension LaunchView {
    
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
