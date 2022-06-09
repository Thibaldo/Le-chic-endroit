//
//  CategoryService.swift
//  Le chic endroit
//
//  Created by Pro on 09/06/2022.
//

import Foundation

struct CategoryService {
    static func fetchCategoryList(completion: @escaping([Category]) -> Void) {
        let url = URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/categories.json")!
          URLSession.shared.fetchData(for: url) { (result: Result<[Category], Error>) in
            switch result {
            case .success(let categoryList):
              completion(categoryList)
            case .failure(let error):
              print(error)
          }
        }
    }
}
