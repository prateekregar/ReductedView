//
//  Products.swift
//  Reducted View
//
//  Created by Prateek on 03/09/23.
//

import SwiftUI

struct Products: View {
    @ObservedObject var viewModel = ProductsViewModel()
    
    var body: some View {
        List {
            if (viewModel.products.isEmpty) {
                ForEach((1...10), id: \.self) { _ in
                    ProductDetailView(product: Product.dummy)
                        .redacted(reason: .placeholder)
                }
            } else {
                ForEach (viewModel.products) { item in
                    ProductDetailView(product: item)
                }
            }
            
        }
        .disabled(viewModel.products.isEmpty)
    }
}

struct Products_Previews: PreviewProvider {
    static var previews: some View {
        Products()
    }
}
