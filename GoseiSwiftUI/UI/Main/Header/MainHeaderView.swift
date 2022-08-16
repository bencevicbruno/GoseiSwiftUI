//
//  MainHeaderView.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 16.02.2022..
//

import SwiftUI
import Fusion

struct MainHeaderView: View {
    
    @Binding var isHamburgerMenuVisible: Bool
    private var onAvatarTapped: EmptyCallback?
    
    @Inject var persistenceService: PersistenceServiceProtocol
    
    var body: some View {
        HStack {
            HamburgerButton(isHamburgerMenuVisible: $isHamburgerMenuVisible)
                .frame(size: 35)
                .padding(.trailing, 20)
            
            Image(.logo_gosei)
                .resizable()
                .scaledToFit()
                .frame(height: 35)
            
            Spacer()
            
            avatar
        }
        .padding(.horizontal, 12)
        .frame(height: Self.height)
        .background(Color.background)
    }
    
    
    init(isHamburgerMenuVisible: Binding<Bool>, onAvatarTapped: EmptyCallback? = nil) {
        self._isHamburgerMenuVisible = isHamburgerMenuVisible
        self.onAvatarTapped = onAvatarTapped
    }
    
    static let height: CGFloat = 45
}

private extension MainHeaderView {
    
    var avatar: some View {
        AsyncImage(url: persistenceService.user?.avatarURL) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(size: 35)
        } placeholder: {
            Image(.icon_avatar)
                .resizable()
                .scaledToFit()
                .frame(size: 35)
        }
        .clipShape(Circle())
        .contentShape(Circle())
        .onTapGesture {
            onAvatarTapped?()
        }
    }
}

struct MainHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MainHeaderView(isHamburgerMenuVisible: .constant(true))
            .background(Color.lightGray)
    }
}
