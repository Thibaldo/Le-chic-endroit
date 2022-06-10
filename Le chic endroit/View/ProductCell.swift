//
//  ProductCell.swift
//  Le chic endroit
//
//  Created by Pro on 07/06/2022.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    // MARK: Properties
    
    static let reuseIdentifier: String = "ProductCell"
    
    var viewModel: ProductViewModel? {
        didSet {
            configure()
        }
    }
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.secondaryLabel.cgColor
        imageView.layer.cornerRadius = 20
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = false
        label.lineBreakMode = .byTruncatingTail
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 14, weight: .black))
        
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 12, weight: .semibold))
        
        return label
    }()
    
    
    // MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(productImageView)
        productImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: -10, paddingRight: -10)
        
        addSubview(titleLabel)
        titleLabel.anchor(top: productImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 8)
        
        addSubview(priceLabel)
        priceLabel.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, paddingTop: 10, paddingLeft: 8)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configure() {
        guard let viewModel = viewModel else {
            return
        }
        
        titleLabel.text = viewModel.title
        priceLabel.text = viewModel.price
        
        
        productImageView.imageFromServerURL(viewModel.imagesUrl?.thumb ?? "", placeHolder: UIImage(named: "image-placeholder"))
        productImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75).isActive = true
        productImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        
    }
}
