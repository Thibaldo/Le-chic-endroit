//
//  ProductService.swift
//  Le chic endroit
//
//  Created by Pro on 07/06/2022.
//

import Foundation

struct ProductService {
    static func fetchProductList(completion: @escaping([Product]) -> Void) {
        let url = URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json")!
          URLSession.shared.fetchData(for: url) { (result: Result<[Product], Error>) in
            switch result {
            case .success(let productList):
              completion(productList)
            case .failure(let error):
              print(error)
          }
        }
    }
}
