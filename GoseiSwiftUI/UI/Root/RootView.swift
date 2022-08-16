//
//  RootView.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 16.02.2022..
//

import SwiftUI
import Fusion

struct RootView: View {
    
    @State private var contentState: ContentState = .launch
    
    @Inject private var persistenceService: PersistenceServiceProtocol
    
//    @ViewBuilder
    var body: some View {
        switch(contentState) {
        case .launch:
            LaunchView()
                .onAppear {
                    setup()
                }
        case .login:
            LoginView($contentState)
        case .main:
            MainView(rootContentState: $contentState)
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
            contentState = persistenceService.user == nil ? .login : .main
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
