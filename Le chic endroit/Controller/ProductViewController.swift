//
//  ProductController.swift
//  Le chic endroit
//
//  Created by Pro on 08/06/2022.
//

import UIKit

class ProductViewController: UIViewController {
    
    // MARK: - Properties
    private var product: ProductViewModel
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()
    
    private let productContentView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 24, weight: .heavy))
        label.textColor = .black
        label.alpha = 0.8
        
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 26, weight: .black))
        label.textColor = .black
        label.textAlignment = .right
        
        return label
    }()
    
    private let descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = .black
        label.alpha = 0.8
        label.text = "Description:"
        
        return label
    }()
    
    private let descriptionTextView: UITextView = {
        let text = UITextView()
        text.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 14, weight: .regular))
        text.textColor = .black
        text.isEditable = false
        
        return text
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textColor = .black
        label.alpha = 0.7
        label.numberOfLines = 0
        label.contentMode = .bottom
        
        return label
    }()
    
    
    // MARK: - Lifecycle
    init(product: ProductViewModel) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(productImageView)
        productImageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor)
        productImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: productImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 30, paddingLeft: 20, paddingRight: 20)
        
        view.addSubview(dateLabel)
        dateLabel.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, paddingTop: 25, paddingLeft: 20)
        
        view.addSubview(priceLabel)
        priceLabel.anchor(top: titleLabel.bottomAnchor, left: dateLabel.rightAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 25, paddingRight: 20)
        
        view.addSubview(descriptionTitleLabel)
        descriptionTitleLabel.anchor(top: priceLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 30, paddingLeft: 20)
        
        view.addSubview(descriptionTextView)
        descriptionTextView.anchor(top: descriptionTitleLabel.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20)
        
        
        
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configure() {
        
        titleLabel.text = product.title
        dateLabel.text = product.creationDate
        priceLabel.text = product.price
        descriptionTextView.text = product.description
        
        productImageView.imageFromServerURL(product.imagesUrl?.thumb ?? "", placeHolder: UIImage(named: "image-placeholder"))
        
        
    }
}
