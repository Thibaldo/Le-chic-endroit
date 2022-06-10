//
//  Category.swift
//  Le chic endroit
//
//  Created by Pro on 09/06/2022.
//

import Foundation

struct Category: Decodable, Hashable {
    let id: Int
    let name: String
    private var _isSelected: Bool?
    
    var isSelected: Bool {
        get { return _isSelected ?? false}
        set { self._isSelected = newValue }
    }
}
