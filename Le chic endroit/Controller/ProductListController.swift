//
//  ProductListController.swift
//  Le chic endroit
//
//  Created by Pro on 07/06/2022.
//

import UIKit

class ProductListController: UICollectionViewController {
    
    var productList = [Product]()
    var categoryList = [Category]()
    
        // MARK: - Lifecycle
    
        override func viewDidLoad() {
            super.viewDidLoad()
            configureUI()
            fetchProductList()
            fetchCategoryList()
        }
    
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.setNavigationBarHidden(true, animated: animated)
        }
    
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            navigationController?.setNavigationBarHidden(false, animated: animated)
        }
    
        // MARK: - API
        func fetchProductList() {
            ProductService.fetchProductList { productList in
                DispatchQueue.main.async {
                    self.productList = productList
                    self.collectionView.reloadData()
                }
            }
        }
    
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
            collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reuseIdentifier)
        }
    
    }
    
    
    // MARK: - UICollectionViewDataSource
    
    extension ProductListController {
    
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return productList.count
        }
    
        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseIdentifier, for: indexPath) as! ProductCell
    
            cell.viewModel = ProductViewModel(product: productList[indexPath.row])
            return cell
        }
    
        override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let controller = ProductController(product: productList[indexPath.row])
    
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    extension ProductListController: UICollectionViewDelegateFlowLayout {
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 1
        }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 1
        }
    
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = (view.frame.width - 2) / 2
            let height = width * 1.6
    
            return CGSize(width: width, height: height)
        }
}



