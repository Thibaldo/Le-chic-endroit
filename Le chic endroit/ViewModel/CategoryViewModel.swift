//
//  CategoryViewModel.swift
//  Le chic endroit
//
//  Created by Pro on 09/06/2022.
//

import Foundation

struct CategoryViewModel {
    private let category: Category
    
    var id: Int {
        return category.id
    }
    
    var name: String {
        return category.name
    }
    
    init(category: Category) {
        self.category = category
    }
}
