//
//  HeaderView.swift
//  Le chic endroit
//
//  Created by Pro on 09/06/2022.
//

import UIKit

class HeaderView: UICollectionReusableView {
    static let identifier = "HeaderCollectionReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
