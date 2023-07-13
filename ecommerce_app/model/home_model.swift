//
//  home_model.swift
//  ecommerce_app
//
//  Created by Rakesh on 13/07/23.
//

import Foundation

class HomeModel : ObservableObject{
    
    @Published var productList: [ProductModel] = []
    @Published var userName: String = ""
    
    init() {
       getProductsData()
    }
    
    /// <#Description#>
   
    func getProductsData(){
        ApiManager.shared.getProducts(completionHandler:{
            response in
            switch response{
            case .success(let product):
                DispatchQueue.main.async {
                    self.productList.append(contentsOf: product)
                  }
                print("productList \(product)")
            case .failure(let error):
                print(error)
            }
        })
    }
    
    
}

extension Data{
    func parseData(removeString string:String) -> Data?{
        let dataAsString = String(data:self , encoding: .utf8)
        
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        
        guard let data = parsedDataString?.data(using: .utf8) else{
            return nil
        }
        print("Here is the data")
        print(data)
        return data
    }
}
