//
//  ProductDetailsView.swift
//  ecommerce_app
//
//  Created by Rakesh on 13/07/23.
//

import SwiftUI

struct ProductDetailsView: View {
    @State var productItem: ProductModel
    var body: some View {
        VStack{
            Text(productItem.title)
                .foregroundColor(.blue)
        }
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    
    static var previews: some View {
        ProductDetailsView(productItem:ProductModel(id: 0, title: "Helo", price: 0.0, description: "", category: "", image: "", rating: Rating(rate: 0.0, count: 0)))
    }
}
