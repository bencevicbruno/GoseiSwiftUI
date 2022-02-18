//
//  SignupView.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 16.02.2022..
//

import SwiftUI

struct SignupView: View {
    
    @Binding var rootContentState: RootView.ContentState
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = SignupViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                backButton
                
                Spacer()
            }
            
            Spacer(minLength: 10)
            
            Image(.logo_gosei)
                .resizable()
                .scaledToFit()
                .padding(.horizontal)
            
            Spacer(minLength: 10)
            
            form
            
            signUpButton
                .padding(.vertical)
            
            TextSeparator(Localizable.or.localized.uppercased())
                .padding(.bottom)
            
            externalSignupButtons
                .padding(.bottom)
            
            Spacer(minLength: 10)
        }
        .padding(.horizontal, 20)
        .background(Color.background)
        .foregroundColor(Color.text)
        .fullScreenCover(item: $viewModel.externalSignupSheet) { type in
            externalSignupSheet(type)
        }
        .navigationBarHidden(true)
    }
    
    init(_ rootContentState: Binding<RootView.ContentState>) {
        self._rootContentState = rootContentState
    }
}

private extension SignupView {
    
    var backButton: some View {
        Image(.icon_arrow_left)
            .resizable()
            .scaledToFit()
            .frame(size: 30)
            .contentShape(Rectangle())
            .onTapGesture {
                dismiss()
            }
    }
    
    var passwordsNotMatchingLabel: some View {
        Text(Localizable.passwords_not_matching.localized)
            .multilineTextAlignment(.leading)
            .font(.system(size: 10))
            .foregroundColor(.red)
            .isVisible(false)
    }
    
    var form: some View {
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
            self.rootContentState = .main
        }
    }
    
    func externalSignupSheet(_ type: ExternalAccountType) -> some View {
        VStack(spacing: 20) {
            Text("\(type.rawValue) SignUp has not been implemented.")
                .font(.playfair(22, .bold))
                .foregroundColor(type.foregroundColor)
            
            Text("Close")
                .font(.workSans(16, .bold))
                .contentShape(Rectangle())
                .onTapGesture {
                    viewModel.closeExternalSignupSheet()
                }
                .padding(5)
                .padding(.horizontal, 10)
                .foregroundColor(type.backgroundColor)
                .background(Capsule().fill(type.foregroundColor))
        }
        .padding(.horizontal, 50)
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center )
        .background(type.backgroundColor)
    }
    
    var externalSignupButtons: some View {
        HStack(spacing: 20) {
            ExternalAccountButton(.google) {
                viewModel.openExternalSignupSheet(.google)
            }
            
            ExternalAccountButton(.facebook) {
                viewModel.openExternalSignupSheet(.facebook)
            }
            
            ExternalAccountButton(.apple) {
                viewModel.openExternalSignupSheet(.apple)
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(.constant(.login))
    }
}
