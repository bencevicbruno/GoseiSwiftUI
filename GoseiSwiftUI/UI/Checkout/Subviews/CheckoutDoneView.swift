//
//  CheckoutDoneView.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 21.02.2022..
//

import SwiftUI

struct CheckoutDoneView: View {
    
    var onReturnToHomePageTapped: EmptyCallback?
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 20)
            
            Image(.ilustration_checkout_successful)
                .resizable()
                .scaledToFit()
                .frame(minWidth: 100, maxWidth: 200, minHeight: 100, maxHeight: 200, alignment: .center)
            
            Spacer(minLength: 20)
            
            Group {
                Text("Your order number is:")
                    .padding(.bottom, 5)
                
                Text("HFS123456789")
            }
            .font(.playfair(16, .bold))
            .foregroundColor(Color.text)
            
            Spacer(minLength: 20)
            
            returnToHomePageButton
            
            Spacer(minLength: 20)
        }
    }
}

private extension CheckoutDoneView {
    
    var returnToHomePageButton: some View {
        Text("RETURN TO HOME PAGE")
            .font(.workSans(16, .regular))
            .foregroundColor(Color.background)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(RoundedRectangle(cornerRadius: 4)
                            .fill(Color.text))
            .contentShape(RoundedRectangle(cornerRadius: 4))
            .onTapGesture {
                onReturnToHomePageTapped?()
            }
    }
}

struct CheckoutDoneView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutDoneView()
    }
}
