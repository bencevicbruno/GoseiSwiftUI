//
//  ProductView.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 21.02.2022..
//

import SwiftUI

struct ProductView: View {
    
    @Binding var isRootVisible: Bool
    @StateObject var viewModel: ProductViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            NavigationHeader(title: "Product Details", onDismiss: {
                isRootVisible.toggle()
            })
            
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 15) {
                    mainInfo
                    
                    subInfo
                    
                    tabHeaders
                    
                    tabContent
                }
            }
            .padding(.horizontal, 10)
        }
        .foregroundColor(Color.text)
        .background(Color.background)
        .navigationBarHidden(true)
    }
    
    init(_ binding: Binding<Bool>, viewModel: @autoclosure @escaping () -> ProductViewModel) {
        self._isRootVisible = binding
        self._viewModel = StateObject(wrappedValue: viewModel())
    }
}

// MARK: - Components
private extension ProductView {
    
    var mainInfo: some View {
        HStack(spacing: 10) {
            Image(viewModel.product.imageName)
                .resizable()
                .scaledToFit()
                .padding()
                .aspectRatio(1.0, contentMode: .fit)
                .frame(maxWidth: .infinity)
            
            VStack(alignment: .leading, spacing: 15) {
                Text("\(viewModel.product.price) $")
                    .font(.workSans(20, .bold))
                    .foregroundColor(.text)
                
                buyNowButton
                
                addToCartButton
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    var subInfo: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(viewModel.product.name)
                .font(.playfair(22, .bold))
            
            Text("256GB")
                .font(.workSans(14, .regular))
        }
    }
    
    
    var tabHeaders: some View {
        HStack(spacing: 0) {
            tabHeader("Description", tab: .description)
                .frame(maxWidth: .infinity)
            
            Spacer(minLength: 15)
            
            tabHeader("Shipping Info", tab: .shippingInfo)
                .frame(maxWidth: .infinity)
            
            Spacer(minLength: 15)
            
            tabHeader("Payment Options", tab: .paymentOptions).frame(maxWidth: .infinity)
        }
        .font(.workSans(14, .bold))
        .foregroundColor(.black)
        .multilineTextAlignment(.center)
    }
    
    var tabContent: AnyView {
        switch(viewModel.currentTab) {
        case .description:
            return AnyView(VStack {
                Text(viewModel.product.description)
                    .font(.workSans(14, .regular))
                
                infoTables
            })
            
        case .shippingInfo:
            return AnyView(VStack(alignment: .leading, spacing: 10) {
                Text("Your items will be shipped within 3-5 working days.")
                    .font(.workSans(14))
                
                Text("Return policy")
                    .font(.workSans(14, .bold))
                
                Text("Returns may be made by mail. The return window for online purchases is 30 days from the date of delivery. Damaged and used goods will not be approved for refund.")
                    .font(.workSans(14))
            })
            
        case .paymentOptions:
            return AnyView(Text("We accepts the following forms of payment for online purchases:\n\nDebit cards\nVisa\nMastercard\nMaestro\n\nThe full transaction value will be charged to your credit card after we have verified your card details, received credit authorisation, confirmed availability and prepared your order for shipping.")
                            .font(.workSans(14)))
        }
    }
}

// MARK: - Subcomponents
private extension ProductView {
    
    var buyNowButton: some View {
        NavigationLink(destination: CheckoutView()) {
            Text("BUY NOW")
                .font(.workSans(14, .medium))
                .foregroundColor(Color.background)
                .padding(7)
                .background(Color.text)
        }
        .isDetailLink(false)
        .buttonStyle(.plain)
    }
    
    var addToCartButton: some View {
        VStack {
            Text("ADD TO CART")
                .font(.workSans(14, .regular))
                .padding(.bottom, 5)
                .background(Color.background)
                .padding(.bottom, 3)
                .background(Color.text)
        }
    }
    
    func tabHeader(_ title: String, tab: ProductViewModel.Tab) -> some View {
        Text(title)
            .foregroundColor(Color.text)
            .padding(.bottom, 5)
            .background(Color.background)
            .padding(.bottom, 3)
            .background(viewModel.currentTab == tab ? Color.text : Color.background)
            .onTapGesture {
                viewModel.switchToTab(tab)
            }
    }
    
    var infoTables: some View {
        VStack(spacing: 0) {
            ForEach(0..<viewModel.product.info.count) { index in
                ProductInfoTable(title: viewModel.product.info[index].title, info: viewModel.product.info[index].info)
            }
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(.constant(true), viewModel: .init(product: .random()))
    }
}
