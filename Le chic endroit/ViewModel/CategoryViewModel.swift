//
//  CategoryViewModel.swift
//  Le chic endroit
//
//  Created by Pro on 09/06/2022.
//

import Foundation

struct CategoryViewModel {
    private let category: Category
    private var _isSelected: Bool
    
    var id: Int {
        return category.id
    }
    
    var name: String {
        return category.name
    }
    
    var isSelected: Bool {
        return _isSelected
    }
    
    init(category: Category, isSelected: Bool?) {
        self.category = category
        
        self._isSelected = isSelected ?? false
    }
}
