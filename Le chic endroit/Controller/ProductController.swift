//
//  ProductController.swift
//  Le chic endroit
//
//  Created by Pro on 08/06/2022.
//

import UIKit

class ProductController: UIViewController {
    
    // MARK: - Properties
    private var product: Product
    
    private let productImageView: UIImageView = {
        let iv = UIImageView()
        
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        
        return iv
    }()
    
    private let isUrgentImageView: UIImageView = {
        let iv = UIImageView()
        let image = UIImage(systemName: "clock.badge.exclamationmark.fill")?.withRenderingMode(.alwaysTemplate)
        iv.image = image
        iv.setHeight(30)
        iv.setWidth(30)
        iv.tintColor = .red
                    
        return iv
    }()
    
    private let productContentView: UIView = {
        let view = UIView()
        
        view.roundCorners(corners: [.topLeft, .topRight], radius: 30)
        
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.alpha = 0.8
        
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26, weight: .heavy)
        label.textColor = .black
        label.textAlignment = .right
        
        return label
    }()
    
    private let descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.alpha = 0.8
        label.text = "Product details"
        
        return label
    }()
    
    private let descriptionTextView: UITextView = {
        let text = UITextView()
        text.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        text.textColor = .black
        
        return text
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .black
        label.alpha = 0.7
        label.numberOfLines = 0
        label.contentMode = .bottom
        
        return label
    }()
    
    
    // MARK: - Lifecycle
    
    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 249, green: 249, blue: 249, alpha: 1)
        
        view.addSubview(productImageView)
        productImageView.imageFromServerURL(product.imagesUrl.thumb ?? "", placeHolder: UIImage(named: "camera"))
        productImageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor)
        productImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        
        configureViewComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configureViewComponents() {
        
        productImageView.addSubview(isUrgentImageView)
        isUrgentImageView.anchor(bottom: productImageView.bottomAnchor, right: productImageView.rightAnchor, paddingBottom: 20, paddingRight: 20)
        
        
        titleLabel.text = product.title
        view.addSubview(titleLabel)
        titleLabel.anchor(top: productImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 30, paddingLeft: 20, paddingRight: 20)

        dateLabel.text = "02/08/2022"
        view.addSubview(dateLabel)
        dateLabel.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, paddingTop: 25, paddingLeft: 20)
        
        priceLabel.text = "10.00€"
        view.addSubview(priceLabel)
        priceLabel.anchor(top: titleLabel.bottomAnchor, left: dateLabel.rightAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 25, paddingRight: 20)

        view.addSubview(descriptionTitleLabel)
        descriptionTitleLabel.anchor(top: priceLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 30, paddingLeft: 20)
        
        view.addSubview(descriptionTextView)
        descriptionTextView.text = product.description
        descriptionTextView.anchor(top: descriptionTitleLabel.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20)
    }
}
