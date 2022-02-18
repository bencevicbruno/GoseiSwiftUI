//
//  RootView.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 16.02.2022..
//

import SwiftUI

struct RootView: View {
    
    @State private var contentState: ContentState = .launch
    
    @ViewBuilder
    var body: some View {
        switch(contentState) {
        case .launch:
            LaunchView()
                .onAppear {
                    setup()
                }
        case .login:
            LoginView(rootContentState: $contentState)
        case .main:
            MainView()
        }
    }
}

extension RootView {
    
    enum ContentState {
        case launch
        case login
        case main
    }
    
    func setup() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            contentState = .login
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
