//
//  Product.swift
//  Le chic endroit
//
//  Created by Pro on 07/06/2022.
//

import Foundation

struct Product: Decodable, Hashable {
    let id: Int
    let categoryId: Int
    let title: String
    let description: String
    let price: Float
    let imagesUrl: ImagesUrl
    let creationDate: String
    let isUrgent: Bool
}

struct ImagesUrl: Decodable, Hashable {
    let small: String?
    let thumb: String?
}
