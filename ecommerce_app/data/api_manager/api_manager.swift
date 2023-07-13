//
//  ApiManager.swift
//  pokemanapp
//
//  Created by Rakesh on 09/07/23.
//

import Foundation

enum ApiErrors: Error {
    case invalidUrl
    case invalidResponse
    case invalidData
    case Error
}


typealias handling = ((Result<[ProductModel],ApiErrors>) -> Void)

class ApiManager {
    
    static let shared = ApiManager();
    
    private init(){}
    
    func getProducts(completionHandler: @escaping handling) -> Void
    {
        ///Add Url
        guard let url = URL(string: Apis.productUrl) else{
            completionHandler(.failure(.invalidUrl))
            return
        }
        
        ///Call Url with Task
       URLSession.shared.dataTask(with: url, completionHandler: {
            data,response,error in
           
           ///Retrived data and check that data should not be empty
           guard let data, error == nil else {
                         completionHandler(.failure(.invalidData))
                         return
                     }
           
           ///Check that status code
           guard let response = response as? HTTPURLResponse,
                            200 ... 299 ~= response.statusCode else {
                          completionHandler(.failure(.invalidResponse))
                          return
                      }
           
           do{
               ///Decode response code
               let todoData = try JSONDecoder().decode([ProductModel].self, from: data)
               completionHandler(.success(todoData))
           }catch{
               completionHandler(.failure(.Error))
           }
           
           
       }).resume()
        
        
    }
}


