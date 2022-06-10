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
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        formatter.currencyCode = "EUR"
        
        return formatter.string(from: NSNumber(value: product.price)) ?? ""
    }
    
    var creationDate: String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = formatter.date(from: product.creationDate) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .none
            
            return dateFormatter.string(from: date)
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
