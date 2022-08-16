//
//  BillingView.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 21.02.2022..
//

import SwiftUI

struct BillingView: View {
    
    @Binding var name: String
    @Binding var cardNumber: String
    @Binding var expirationMonth: String
    @Binding var expirationYear: String
    @Binding var cvv: String
    
    var onConfirmTapped: EmptyCallback?
    
    var body: some View {
        VStack(spacing: 20) {
            inputField($name, title: "name")
            
            HStack(alignment: .bottom, spacing: 0) {
                inputField($cardNumber, title: "Card Number")
                
                VStack(alignment: .trailing) {
                    Image(.logo_visa)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 15)
                    
                    Rectangle()
                        .fill(Color.text)
                        .frame(height: 1)
                }
                .frame(width: 60)
            }
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Expiration Date")
                        .font(.playfair(16, .bold))
                        .foregroundColor(Color.text)
                    
                    HStack(alignment: .bottom, spacing: 2) {
                        VStack(spacing: 0) {
                            TextField("", text: $expirationMonth)
                                .frame(height: 30)
                                .padding(.bottom, 5)
                            
                            Rectangle()
                                .fill(Color.text)
                                .frame(height: 1)
                        }
                        
                        Image(.icon_slash)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                            
                        VStack(spacing: 0) {
                            TextField("", text: $expirationYear)
                                .frame(height: 30)
                                .padding(.bottom, 5)
                            
                            Rectangle()
                                .fill(Color.text)
                                .frame(height: 1)
                        }
                    }
                    .frame(height: 35)
                }
                
                Spacer(minLength: 70)
                
                inputField($cvv, title: "CVV")
                    .frame(width: 60)
            }
            
            Spacer(minLength: 20)
            
            confirmButton
            
            Spacer(minLength: 20)
        }
    }
}

private extension BillingView {
    
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
    
    var confirmButton: some View {
        Text("CONFIRM")
            .font(.workSans(16, .regular))
            .foregroundColor(Color.background)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(RoundedRectangle(cornerRadius: 4)
                            .fill(Color.text))
            .contentShape(RoundedRectangle(cornerRadius: 4))
            .onTapGesture {
                onConfirmTapped?()
            }
    }
}

struct BillingView_Previews: PreviewProvider {
    static var previews: some View {
        BillingView(name: .constant("Bruno"), cardNumber: .constant("123456789"), expirationMonth: .constant("04"), expirationYear: .constant("1999"), cvv: .constant("25"))
    }
}
