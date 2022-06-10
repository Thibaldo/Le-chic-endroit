//
//  CategoryCell.swift
//  Le chic endroit
//
//  Created by Pro on 09/06/2022.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = "CategoryCell"
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.textAlignment = .center
        
        return label
    }()
    
    var viewModel: CategoryViewModel? {
        didSet {
            layer.cornerRadius = 10;
            layer.masksToBounds = true;
            layer.borderWidth = 3
            layer.borderColor = UIColor.black.cgColor
            
            addSubview(nameLabel)
            nameLabel.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
            nameLabel.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
            
            configure()
        }
    }
    
    func configure() {
        nameLabel.text = viewModel?.name
        
        
        if viewModel?.isSelected != nil && viewModel?.isSelected == true {
            backgroundColor = .black
            nameLabel.textColor = .white
        } else {
            backgroundColor = .white
            nameLabel.textColor = .black
        }
    }
}
