//
//  ProductListController.swift
//  Le chic endroit
//
//  Created by Pro on 07/06/2022.
//

import UIKit

class ProductListController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var collectionViewA: UICollectionView!
    var collectionViewB: UICollectionView!
    
    var productList = [Product]()
    var categoryList = [Category]()
    var selectedCategory: Int?
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = ProductListController.createLayout()
        
        
        collectionViewA = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionViewB = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        
        
        
        
        collectionViewA.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseIdentifier)
        collectionViewA.dataSource = self
        collectionViewA.delegate = self
        
        collectionViewB.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reuseIdentifier)
        collectionViewB.dataSource = self
        collectionViewB.delegate = self
        
        view.addSubview(collectionViewA)
        view.addSubview(collectionViewB)
        
        
        fetchProductList()
        fetchCategoryList()
    }
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            if sectionNumber == 0 {
                let item = NSCollectionLayoutItem.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.leading = 10
                item.contentInsets.trailing = 10
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.30), heightDimension: .fractionalHeight(0.06)), subitems: [item])
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
        
        print("OK")
        
        return productList.filter { product in
            return product.categoryId == selectedCategory
        }
    }
    
    
    // MARK: - API
    func fetchProductList() {
        ProductService.fetchProductList { productList in
            DispatchQueue.main.async {
                self.productList = productList
                self.collectionViewB.reloadData()
            }
        }
    }
    
    func fetchCategoryList() {
        CategoryService.fetchCategoryList { categoryList in
            DispatchQueue.main.async {
                self.categoryList = categoryList
                self.collectionViewA.reloadData()
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
        
        print(indexPath.section)
        
        if indexPath.section == 0 {
            let cell = collectionViewA.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIdentifier, for: indexPath) as! CategoryCell
            cell.viewModel = CategoryViewModel(category: categoryList[indexPath.row])
            return cell
        }
        
        let cell = collectionViewB.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseIdentifier, for: indexPath) as! ProductCell
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
            
            collectionViewB.reloadData()
        } else {
            let controller = ProductController(product: ProductViewModel(product: productList[indexPath.row]))
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}

