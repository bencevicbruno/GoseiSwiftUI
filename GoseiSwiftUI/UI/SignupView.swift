//
//  SignupView.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 16.02.2022..
//

import SwiftUI

struct SignupView: View {
    
    private var onSignUp: EmptyCallback?
    
    @State private var externalSignupSheet: ExternalLoginType? = nil
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Image(.icon_arrowLeft)
                    .resizable()
                    .scaledToFit()
                    .frame(size: 30)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        dismiss()
                    }
                
                Spacer()
            }
            
            Spacer()
            
            Image(.logo_gosei)
                .resizable()
                .scaledToFit()
                .padding(.horizontal)
            
            Spacer()
            
            VStack(alignment: .leading) {
//                InputField($viewModel.email, hint: Localizable.email.localized.capitalized)
                
                Rectangle()
                    .fill(.blue)
                    .frame(height: 60)
                
//                PasswordField($viewModel.password)
                Rectangle()
                    .fill(.blue)
                    .frame(height: 60)
                
//                PasswordField($viewModel.repeatedPassword, hint: Localizable.repeat_password.localized)
                Rectangle()
                    .fill(.blue)
                    .frame(height: 60)
                
                passwordsNotMatchingLabel
            }
            
            signUpButton
                .padding(.vertical)
            
            TextSeparator(Localizable.or.localized.uppercased())
            
            HStack(spacing: 20) {
                externalLoginButton(.google)
                
                externalLoginButton(.facebook)
                
                externalLoginButton(.apple)
            }
            .padding(.bottom)
            
            Spacer()
        }
        .padding(.horizontal, 20).background(Color.background)
        .foregroundColor(Color.text)
        .sheet(item: $externalSignupSheet) { type in
            externalSignupSheet(type)
        }
        .navigationBarHidden(true)
    }
    
    init(onSignUp: EmptyCallback? = nil) {
        self.onSignUp = onSignUp
    }
}

private extension SignupView {
    
    var passwordsNotMatchingLabel: some View {
        Text(Localizable.passwords_not_matching.localized)
            .multilineTextAlignment(.leading)
            .font(.system(size: 10))
            .foregroundColor(.red)
            .isVisible(false)
    }
    
    var signUpButton: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.goseiRed)
            
            Text("SIGN UP")
                .font(.workSans(16, .medium))
                .foregroundColor(.white)
        }
        .frame(height: 60)
        .onTapGesture {
           onSignUp?()
        }
    }
    
    func externalLoginButton(_ type: ExternalLoginType, onTapped: EmptyCallback? = nil) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .fill(Color.background)
            
            type.logoImage
                .resizable()
                .scaledToFit()
                .shadow(color: .text.opacity(0.2), radius: 5, x: 3, y: 3)
                .frame(size: 40 / 2)
        }
        .frame(size: 40)
        .shadow(color: .text.opacity(0.2), radius: 5, x: 3, y: 3)
        .onTapGesture {
            externalSignupSheet = type
        }
    }
    
    func externalSignupSheet(_ type: ExternalLoginType) -> some View {
        let foregroundColor: Color
        let backgroundColor: Color
        
        switch (type) {
        case .google:
            foregroundColor = .black
            backgroundColor = .white
        case .facebook:
            foregroundColor = .white
            backgroundColor = .facebookBlue
        case .apple:
            foregroundColor = .white
            backgroundColor = .black
        }
        
        return VStack(spacing: 20) {
            Text("\(type.rawValue) SignUp has not been implemented.")
                .font(.playfair(22, .bold))
                .foregroundColor(foregroundColor)
            
            Text("Close")
                .font(.workSans(16, .bold))
                .contentShape(Rectangle())
                .onTapGesture {
                    externalSignupSheet = nil
                }
                .padding(5)
                .padding(.horizontal, 10)
                .foregroundColor(backgroundColor)
                .background(Capsule().fill(foregroundColor))
        }
        .padding(.horizontal, 50)
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center )
        .background(backgroundColor)
    }
}


struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
