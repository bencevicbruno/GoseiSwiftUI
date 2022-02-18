//
//  HamburgerMenu.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 16.02.2022..
//

import SwiftUI

struct HamburgerMenu: View {
    
    @Binding var isVisible: Bool
    private var onItemTapped: ((Int) -> Void)?
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            BlurredView(.regular)
                .isVisible(isVisible)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        isVisible.toggle()
                    }
                }
            
            menu
                .offset(x: isVisible ? 0 : -Self.width, y: 0)
        }
    }
    
    init(_ isVisible: Binding<Bool>, onItemTapped: ((Int) -> Void)? = nil) {
        self._isVisible = isVisible
        self.onItemTapped = onItemTapped
    }
    
    static let width: CGFloat = 300
}

private extension HamburgerMenu {
    
    var menu: some View {
        VStack(alignment: .leading) {
            ForEach(HamburgerMenuItem.allCases) { item in
                rowCard(item)
            }
            
            Spacer()
        }
        .padding(.horizontal, 12)
        .frame(width: 300)
        .background(Color.background)
    }
    
    func rowCard(_ item: HamburgerMenuItem) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(item.title)
                .font(.playfair(24, .extraBold))
                .foregroundColor(Color.text)
            
            Rectangle()
                .frame(height: 1)
                .padding(.top, 10)
                .padding(.bottom, 12)
        }
        .onTapGesture {
            onItemTapped?(item.index)
        }
    }
}

struct HamburgerMenu_Previews: PreviewProvider {
    static var previews: some View {
        HamburgerMenu(.constant(true))
    }
}
