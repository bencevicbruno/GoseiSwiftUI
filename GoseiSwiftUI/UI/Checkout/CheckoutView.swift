//
//  CheckoutView.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 21.02.2022..
//

import SwiftUI

struct CheckoutView: View {
    
    @StateObject var viewModel = CheckoutViewModel()
    
    @EnvironmentObject var productCoordinator: ProductCoordinator
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            header
            
            CheckoutProgressBar($viewModel.step)
                .padding(.horizontal, 40)
                .padding(.bottom, 40)
            
            content
                .transition(.opacity)
                .padding(.horizontal, 40)
            
        }
        .background(Color.background)
        .foregroundColor(Color.text)
        .navigationBarHidden(true)
    }
}

private extension CheckoutView {
    
    var header: some View {
        HStack(spacing: 0) {
            Image(.icon_arrow_left)
                .resizable()
                .scaledToFit()
                .frame(size: 30)
                .padding(5)
                .isVisible(viewModel.step == .billing)
                .contentShape(Rectangle())
                .onTapGesture {
                    viewModel.step = .shipping
                }
            
            Spacer(minLength: 10)
            
            Text(viewModel.step.title)
                .font(.playfair(18, .bold))
            
            Spacer(minLength: 10)
            
            Image(.icon_x)
                .resizable()
                .scaledToFit()
                .frame(size: 20)
                .padding(10)
                .isHidden(viewModel.step == .done)
                .contentShape(Rectangle())
                .onTapGesture {
                    dismiss()
                }
        }
    }
    
    @ViewBuilder
    var content: some View {
        switch(viewModel.step) {
        case .shipping:
            ShippingView(adress: $viewModel.adress, streetNumber: $viewModel.streetNumber, country: $viewModel.country, onCheckoutTapped: {
                
                viewModel.step = .billing
            })
        case .billing:
            BillingView(name: $viewModel.name, cardNumber: $viewModel.cardNumber, expirationMonth: $viewModel.expirationMonth, expirationYear: $viewModel.expirationYear, cvv: $viewModel.cvv, onConfirmTapped: {
                viewModel.step = .done
            })
        case .done:
            CheckoutDoneView(onReturnToHomePageTapped: {
                productCoordinator.isRootVisible = false
            })
        }
    }
}


struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(viewModel: CheckoutViewModel(step: .billing))
            .environmentObject(PopToRootCoordinator(popToRoot: {}))
    }
}
