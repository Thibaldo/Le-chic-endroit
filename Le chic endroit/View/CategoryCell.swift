//
//  CategoryCell.swift
//  Le chic endroit
//
//  Created by Pro on 09/06/2022.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = "CategoryCell"
    
    var viewModel: CategoryViewModel? {
        didSet {
            backgroundColor = .red
            layer.cornerRadius = 10;
            layer.masksToBounds = true;
            layer.borderWidth = 3
            layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.8)

            addSubview(nameLabel)
            nameLabel.text = viewModel?.name
            nameLabel.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
            nameLabel.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        }
    }
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .center
        
        return label
    }()
    
    func configure() {
    }
}
