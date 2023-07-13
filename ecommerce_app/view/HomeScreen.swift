//
//  HomeScreen.swift
//  ecommerce_app
//
//  Created by Rakesh on 13/07/23.
//

import SwiftUI
import Kingfisher

struct HomeScreen: View {
    let gridLayout = [
           GridItem(.flexible()),
           GridItem(.flexible()),
       ]
    @StateObject var homeVModel = HomeModel()
    
    var body: some View {
        NavigationView{
            VStack{
                if(homeVModel.productList.isEmpty){
                    ProgressView()
                }else{
                    VStack{
                        ScrollView {
                            LazyVGrid(columns: gridLayout, spacing: 16) {
                                
                                ForEach(homeVModel.productList,id: \.id){ item in
                                    
                                    NavigationLink(destination: ProductDetailsView(productItem: item), label: {
                                        VStack(spacing: 10){
                                            KFImage(URL(string: item.image)!).resizable()
                                                .frame(width: 100,height: 100)
                                                .ignoresSafeArea()
                                                .aspectRatio(contentMode: .fit)
                                            
                                            Divider()
                                            
                                            Text("\(item.title)")
                                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                                .foregroundColor(.black).padding(EdgeInsets(top: 10.0, leading: 10.0, bottom: 10.0, trailing: 10.0))
                                            
                                        }.background(.white).overlay{
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color.gray.opacity(0.2), lineWidth: 0.5)
                                        }
                                        
                                    }).onAppear{
                                        homeVModel.getProductsData()
                                    }
                                    
                                }
                            }
                        }}
                }
            }
        }.navigationTitle("Products Data")
        
            
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeScreen()
        }
    }
}
