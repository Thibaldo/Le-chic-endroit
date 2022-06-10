//
//  ProductListController.swift
//  Le chic endroit
//
//  Created by Pro on 07/06/2022.
//

import UIKit

class ProductListController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var categoryCollectionView: UICollectionView!
    var productCollectionView: UICollectionView!
    
    var productList = [Product]()
    var categoryList = [Category]()
    var selectedCategory: Int?
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = ProductListController.createLayout()
        
        
        categoryCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        productCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        
        
        categoryCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseIdentifier)
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        
        productCollectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reuseIdentifier)
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
        
        view.addSubview(categoryCollectionView)
        view.addSubview(productCollectionView)
        
        
        fetchProductList()
        fetchCategoryList()
    }
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            if sectionNumber == 0 {
                let item = NSCollectionLayoutItem.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.leading = 10
                item.contentInsets.trailing = 10
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.30), heightDimension: .fractionalHeight(0.05)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                
                section.orthogonalScrollingBehavior = .continuous
                
                return section
            }
            
            
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
            item.contentInsets.trailing = 10
            item.contentInsets.top = 10
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.4)), subitems: [item])
            group.contentInsets.leading = 10
            group.contentInsets.trailing = 10
            let section = NSCollectionLayoutSection(group: group)
            
            return section
        }
    }
    
    func filterProducts() -> [Product] {
        if selectedCategory == nil {
            return productList
        }
        
        return productList.filter { product in
            return product.categoryId == selectedCategory
        }
    }
    
    func fetchProductList() {
        ProductService.fetchProductList { productList in
            DispatchQueue.main.async {
                self.productList = productList
                self.productCollectionView.reloadData()
            }
        }
    }
    
    func fetchCategoryList() {
        CategoryService.fetchCategoryList { categoryList in
            DispatchQueue.main.async {
                self.categoryList = categoryList
                self.categoryCollectionView.reloadData()
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return categoryList.count
        }
        
        return filterProducts().count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIdentifier, for: indexPath) as! CategoryCell
            cell.viewModel = CategoryViewModel(category: categoryList[indexPath.row], isSelected: selectedCategory == categoryList[indexPath.row].id)
            return cell
        }
        
        let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseIdentifier, for: indexPath) as! ProductCell
        cell.viewModel = ProductViewModel(product: filterProducts()[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if selectedCategory == categoryList[indexPath.row].id {
                selectedCategory = nil
            } else {
                selectedCategory = categoryList[indexPath.row].id
            }
            
            productCollectionView.reloadItems(at: [indexPath])
        } else {
            let controller = ProductViewController(product: ProductViewModel(product: filterProducts()[indexPath.row]))
            
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}

