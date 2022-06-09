//
//  ProductViewModel.swift
//  Le chic endroit
//
//  Created by Pro on 08/06/2022.
//

import Foundation

struct ProductViewModel {
    private let product: Product
    
    var title: String {
        return product.title
    }
    
    var description: String {
        return product.description
    }
    
    var imagesUrl: ImagesUrl? {
        return product.imagesUrl
    }
    
    var price: String {
        return product.price.formatted(
            .currency(code:"EUR").locale(Locale(identifier: Locale.current.identifier))
        )
    }
    
    var isUrgent: Bool {
        return product.isUrgent
    }
    
    init(product: Product) {
        self.product = product
    }
}
