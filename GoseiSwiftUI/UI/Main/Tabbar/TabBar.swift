//
//  TabBarView.swift
//  Gosei
//
//  Created by Bruno Benčević on 29.11.2021..
//

import SwiftUI

struct TabBar: View {
    
    @Binding var currentTab: Tab
    
    var body: some View {
        ZStack {
            Capsule()
                .fill(Color.background)
            
            HStack {
                ForEach(Tab.allCases) { tab in
                    TabBarItem(tab, isSelected: currentTab == tab)
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            currentTab = tab
                        }
                }
            }
            .padding(.horizontal)
        }
        .frame(height: Self.height)
    }
    
    static var height: CGFloat = 65
    static var safeHeight: CGFloat = 65 + 2*10
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(currentTab: .constant(.home))
            .padding()
            .background(Color.lightGray)
    }
}
