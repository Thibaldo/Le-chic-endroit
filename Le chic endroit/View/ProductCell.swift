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
        let iv = UIImageView()
        
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 12, weight: .bold))
        label.textColor = .label

//        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        
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

        productImageView.imageFromServerURL(viewModel.imagesUrl?.thumb ?? "", placeHolder: UIImage(named: "camera"))
        productImageView.layer.cornerRadius = 20
        productImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75).isActive = true
        productImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        
        
        if (viewModel.isUrgent == true) {
            let isUrgentImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20));

            if let image = UIImage(systemName: "clock.badge.exclamationmark.fill")?.withRenderingMode(.alwaysTemplate) {
                isUrgentImageView.image = image
                isUrgentImageView.tintColor = .red
            }

            addSubview(isUrgentImageView)

            isUrgentImageView.anchor(top: productImageView.topAnchor, right: productImageView.rightAnchor, paddingTop: 10, paddingRight: 20)
        }
    }
}
