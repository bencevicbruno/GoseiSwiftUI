//
//  ShippingView.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 21.02.2022..
//

import SwiftUI

struct ShippingView: View {
    
    @Binding var adress: String
    @Binding var streetNumber: String
    @Binding var country: String
    var onCheckoutTapped: EmptyCallback?
    
    var body: some View {
        VStack(spacing: 20) {
            inputField($adress, title: "Adress")
            
            inputField($streetNumber, title: "Street Number")
            
            inputField($country, title: "Country")
            
            Spacer(minLength: 20)
            
            checkoutButton
            
            Spacer(minLength: 20)
        }
    }
}

private extension ShippingView {
    
    func inputField(_ binding: Binding<String>, title: String) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.playfair(16, .bold))
                .foregroundColor(Color.text)
            
            TextField("", text: binding)
                .frame(height: 30)
                .padding(.bottom, 5)
            
            Rectangle()
                .fill(Color.text)
                .frame(height: 1)
            
        }
    }
    
    var checkoutButton: some View {
        Text("CHECKOUT")
            .font(.workSans(16, .regular))
            .foregroundColor(Color.background)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(RoundedRectangle(cornerRadius: 4)
                            .fill(Color.text))
            .contentShape(RoundedRectangle(cornerRadius: 4))
            .onTapGesture {
                onCheckoutTapped?()
            }
    }
}

struct ShippingView_Previews: PreviewProvider {
    static var previews: some View {
        ShippingView(adress: .constant("Address"), streetNumber: .constant("Street Number"), country: .constant("Country"))
    }
}
