//
//  ProductsViewModel.swift
//  Reducted View
//
//  Created by Prateek on 03/09/23.
//

import Foundation

class ProductsViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    
    init() {
        getProducts { result in
            switch result {
            case .success(let productResponse):
                DispatchQueue.main.async {
                    self.products = productResponse.products
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func getProducts(completion: @escaping  (Result<ProductResponse, Error>) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { //making it wait to show the reductedView
            guard let url = URL(string: "https://dummyjson.com/products") else {
                completion(.failure(NSError(domain: "Invalid URL", code: 0)))
                return
            }
            
            URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    completion(.failure(NSError(domain: "Invalid response", code: 0, userInfo: nil)))
                    return
                }
                
                if let data = data {
                    do {
                        let jsonData = try JSONDecoder().decode(ProductResponse.self, from: data)
                        print(jsonData)
                        completion(.success(jsonData))
                    } catch {
                        completion(.failure(error))
                    }
                } else {
                    completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                }
            }.resume()
        }
    }
    
}
