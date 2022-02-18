//
//  LoginView.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 16.02.2022..
//

import SwiftUI

struct LoginView: View {
    
    @Binding var rootContentState: RootView.ContentState
    
    @State private var externalLoginSheet: ExternalLoginType? = nil
    @State private var showingSignUp = false
    
    var onShowMain: EmptyCallback?
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer(minLength: 10)
                
                Image(.logo_gosei)
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                Spacer(minLength: 10)
                
                externalLoginButtons
                    .padding()
                
                TextSeparator(Localizable.or.localized.uppercased())
                    .padding(.vertical)
                
                VStack(alignment: .leading) {
    //                InputField($viewModel.email, hint: Localizable.email.localized.capitalized)
    //                    .frame(height: 60)
                    Rectangle()
                        .fill(Color.facebookBlue)
                        .frame(height: 60)
                    
    //                PasswordField($viewModel.password)
    //                    .frame(height: 60)
                    Rectangle()
                        .fill(Color.facebookBlue)
                        .frame(height: 60)
                    
                    invalidCredentialsLabel
                }
                
                loginButton
                    .padding(.vertical)
                
                signupLabel
                    .padding(.all.subtracting(.top))
                
                Spacer(minLength: 10)
                
                NavigationLink(destination: SignupView(onSignUp: onShowMain), isActive: $showingSignUp) { EmptyView() }
            }
            .padding(.horizontal, 20)
            .background(Color.lightGray)
            .sheet(item: $externalLoginSheet) { type in
                externalLoginSheet(type)
            }
            
            .navigationBarBackButtonHidden(true)
        }
    }
}

private extension LoginView {
    
    var externalLoginButtons: some View {
        HStack(spacing: 20) {
            externalLoginButton(.google)
            
            externalLoginButton(.facebook)
            
            externalLoginButton(.apple)
        }
    }
    
    var invalidCredentialsLabel: some View {
        Text(Localizable.wrong_credidentials.localized)
            .multilineTextAlignment(.leading)
            .font(.system(size: 10))
            .foregroundColor(.red)
//            .isHidden(!viewModel.areCredidentialsInvalid)
    }
    
    var loginButton: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.goseiRed)
            
            Text(Localizable.log_in.localized.uppercased())
                .font(.workSans(16, .medium))
                .foregroundColor(.white)
        }
        .frame(height: 60)
        .onTapGesture {
            rootContentState = .login
        }
    }
    
    var signupLabel: some View {
        Group {
            Text(Localizable.new_to_gosei.localized.uppercased())
                .fontWeight(.medium)
                .foregroundColor(Color.text)
            + Text(" " + Localizable.sign_up.localized.uppercased())
                .fontWeight(.medium)
                .foregroundColor(Color.goseiRed)
        }
        .multilineTextAlignment(.center)
        .onTapGesture {
            self.showingSignUp = true
        }
    }
}

private extension LoginView {
    
    func externalLoginButton(_ type: ExternalLoginType) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .fill(Color.background)
            
            type.logoImage
                .resizable()
                .scaledToFit()
                .shadow(color: Color.text.opacity(0.2), radius: 5, x: 3, y: 3)
                .frame(size: 40 / 2)
        }
        .frame(size: 40)
        .shadow(color: Color.text.opacity(0.2), radius: 5, x: 3, y: 3)
        .onTapGesture {
            self.externalLoginSheet = type
        }
    }
    
    func externalLoginSheet(_ type: ExternalLoginType) -> some View {
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
            Text("\(type.rawValue) \(Localizable.login_is_not_implemented.localized)")
                .font(.playfair(22, .bold))
                .foregroundColor(foregroundColor)
            
                 Text(Localizable.close.localized.capitalized)
                .font(.workSans(16, .bold))
                .contentShape(Rectangle())
                .onTapGesture {
                    self.externalLoginSheet = nil
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(rootContentState: .constant(.login))
    }
}
