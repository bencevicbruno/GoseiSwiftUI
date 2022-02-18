//
//  LoginView.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 16.02.2022..
//

import SwiftUI

struct LoginView: View {
    
    @Binding var rootContentState: RootView.ContentState
    
    @StateObject private var viewModel = LoginViewModel()
    
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
                
                form
                
                loginButton
                    .padding(.vertical)
                
                signupLabel
                    .padding(.all.subtracting(.top))
                
                Spacer(minLength: 10)
                
                NavigationLink(destination: SignupView($rootContentState), isActive: $viewModel.showingSignUp)
            }
            .padding(.horizontal, 20)
            .fullScreenCover(item: $viewModel.externalLoginSheet) { type in
                externalLoginSheet(type)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    init(_ rootContentState: Binding<RootView.ContentState>) {
        self._rootContentState = rootContentState
    }
}

private extension LoginView {
    
    var externalLoginButtons: some View {
        HStack(spacing: 20) {
            ExternalAccountButton(.google) {
                viewModel.openExternalLoginSheet(.google)
            }
            
            ExternalAccountButton(.facebook) {
                viewModel.openExternalLoginSheet(.facebook)
            }
            
            ExternalAccountButton(.apple) {
                viewModel.openExternalLoginSheet(.apple)
            }
        }
    }
    
    var form: some View {
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
    }
    
    var invalidCredentialsLabel: some View {
        Text(Localizable.wrong_credidentials.localized)
            .multilineTextAlignment(.leading)
            .font(.system(size: 10))
            .foregroundColor(.red)
            .isVisible(viewModel.areCredidentialsInvalid)
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
            rootContentState = .main
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
            viewModel.goToSignup()
        }
    }
}

private extension LoginView {
    
    func externalLoginSheet(_ type: ExternalAccountType) -> some View {
        VStack(spacing: 20) {
            Text("\(type.rawValue) \(Localizable.login_is_not_implemented.localized)")
                .font(.playfair(22, .bold))
                .foregroundColor(type.foregroundColor)
            
            Text(Localizable.close.localized.capitalized)
                .font(.workSans(16, .bold))
                .contentShape(Rectangle())
                .onTapGesture {
                    viewModel.closeExternalLoginSheet()
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
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(.constant(.login))
    }
}
