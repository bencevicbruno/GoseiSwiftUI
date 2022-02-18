//
//  MainView.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 16.02.2022..
//

import SwiftUI

struct MainView: View {
    
    @State private var isHamburgerMenuVisible = false
    @State private var isSignOutDIalogVisible = false
    
    var body: some View {
        VStack {
            MainHeaderView(isHamburgerMenuVisible: $isHamburgerMenuVisible, avatarURL: nil, onAvatarTapped: nil)
            
            ZStack(alignment: .top) {
                content
                
//                tabBar
//                    .padding(.bottom, 10)
                
                HamburgerMenu($isHamburgerMenuVisible) { index in
                    hamburgerItemTapped(index)
                }
            }
            
//                NavigationLink(destination: LoginView(), isActive: $showingLogin) { EmptyView() }
        }
        .confirmationDialog(isShowing: isSignOutDIalogVisible, title: Localizable.sign_out.localized, description: Localizable.sign_out_message.localized, confirmTitle: Localizable.sign_out.localized, onDismissed: {} , onConfirmed: {
            self.goToLogin()
        })
    }
}

private extension MainView {
    
    func goToLogin() {
       
        withAnimation {
            isHamburgerMenuVisible = false
            isSignOutDIalogVisible = false
        }
    }
    
    var content: some View {
        VStack {
            Spacer()
            
            Text("hihi hohi")
                .foregroundColor(.red)
                .padding(100)
                .background(.blue)
            
            Spacer()
        }
    }
    
    func hamburgerItemTapped(_ index: Int) {
        withAnimation {
            isSignOutDIalogVisible = true
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
