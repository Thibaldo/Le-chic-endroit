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
    
    var creationDate: String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = formatter.date(from: product.creationDate) {
            return date.formatted(date: .abbreviated, time: .omitted)
        }
        return ""
    }
    
    var isUrgent: Bool {
        return product.isUrgent
    }
    
    init(product: Product) {
        self.product = product
    }
}
