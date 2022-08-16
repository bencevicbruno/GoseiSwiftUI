//
//  MainView.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 16.02.2022..
//

import SwiftUI

struct MainView: View {
    
    @Binding var rootContentState: RootView.ContentState
    
    @State private var isHamburgerMenuVisible = false
    @State private var isSignOutDIalogVisible = false
    @State private var currentTab: Tab = .home
    @State private var isTabBarVisible = true
    
    var body: some View {
        NavigationView {
            VStack {
                MainHeaderView(isHamburgerMenuVisible: $isHamburgerMenuVisible, onAvatarTapped: nil)
                
                ZStack(alignment: .top) {
                    content
                    
                    tabBar
                        .padding(.bottom, 10)
                    
                    HamburgerMenu($isHamburgerMenuVisible) { index in
                        hamburgerItemTapped(index)
                    }
                }
            }
            .confirmationDialog(isShowing: isSignOutDIalogVisible, title: Localizable.sign_out.localized, description: Localizable.sign_out_message.localized, confirmTitle: Localizable.sign_out.localized, onDismissed: {} , onConfirmed: {
                self.goToLogin()
            })
            .navigationViewStyle(.stack)
            .removeNavigationBar()
        }
    }
}

private extension MainView {
    
    func goToLogin() {
        self.rootContentState = .login
    }
    
    var content: some View {
        TabView(selection: $currentTab) {
            HomeView()
                .tag(Tab.home)
            
            SearchView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tag(Tab.search)
            
            WishlistView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tag(Tab.wishlist)
            
            CartView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tag(Tab.cart)
        }
    }
    
    var tabBar: some View {
        VStack {
            Spacer()
            
            TabBar(currentTab: $currentTab)
                .shadow(radius: 5)
                .offset(x: 0, y: isTabBarVisible ? 0 : 2 * TabBar.height)
            
        }
        .padding(.horizontal, 10)
    }
    
    func hamburgerItemTapped(_ index: Int) {
        withAnimation {
            isSignOutDIalogVisible = true
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(rootContentState: .constant(.main))
    }
}
