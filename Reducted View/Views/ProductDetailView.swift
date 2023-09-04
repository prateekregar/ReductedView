//
//  ProductDetailView.swift
//  Reducted View
//
//  Created by Prateek on 04/09/23.
//

import SwiftUI
import URLImage

struct ProductDetailView: View {
    @State var product: Product
    
    var body: some View {
        HStack {
            URLImage(URL(string: product.thumbnail)!) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(product.title)
                    .lineLimit(2)
                Text(product.description)
                    .lineLimit(3)
                Text("Brand: \(product.brand)")
                Text("Price: $\(String(format: "%.2f", ceil(product.price*100)/100))")
            }
        }

    }
}

struct PorductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product.dummy)
    }
}
