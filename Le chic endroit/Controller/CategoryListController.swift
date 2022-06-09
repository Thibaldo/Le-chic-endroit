//
//  CategoryListController.swift
//  Le chic endroit
//
//  Created by Pro on 09/06/2022.
//

import UIKit

private let reuseIdentifier = "CategoryCell"

class CategoryListController: UICollectionViewController {
    
    var categoryList = [Category]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        fetchCategoryList()
    }
    
    // MARK: - API
    func fetchCategoryList() {
        CategoryService.fetchCategoryList { categoryList in
            DispatchQueue.main.async {
                self.categoryList = categoryList
                self.collectionView.reloadData()
            }
        }
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        collectionView.backgroundColor = .white
        collectionView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.20).isActive = true
        
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
}


// MARK: - UICollectionViewDataSource

extension CategoryListController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoryCell
        
        cell.viewModel = CategoryViewModel(category: categoryList[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("TAP")
    }
    
}

// MARK: - UICollectionViewDelegate



// MARK: - UICollectionViewDelegateFlowLayout

extension CategoryListController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 4
        let height = view.frame.height
        
        return CGSize(width: width, height: height)
    }
}
