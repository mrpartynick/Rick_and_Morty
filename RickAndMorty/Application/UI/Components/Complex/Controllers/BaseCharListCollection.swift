//
//  BaseArticlesViewController.swift
//  News Browser
//
//  Created by Николай Циминтия on 02.08.2023.
//

import UIKit

open class BaseCharListCollection: UICollectionViewController {
    
    internal enum State {
        case Loading
        case Showing
    }

    internal var state: State = .Loading {
        didSet {
            collectionView.reloadData()
        }
    }
    
    internal var dataObject: ICharDataObject? = MockDataObject()
    
    private let baseCellType = CharCell.self
    private let baseCellID = CharCell.id
    
    private let shimmerCellType = ShimmerCell.self
    private let shimmerCellId = ShimmerCell.id

    //MARK: - init
    init() {
        super.init(collectionViewLayout: UICollectionViewLayout())
        let layout = createLayout()
        collectionView.collectionViewLayout = layout
        
        collectionView.register(baseCellType, forCellWithReuseIdentifier: baseCellID)
        collectionView.register(shimmerCellType, forCellWithReuseIdentifier: shimmerCellId)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - create layout
    private func createLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        // Spacing configuration
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 45, left: 16, bottom: 0, right: 16)
        
        // items size configuration
        let itemsPerRow: CGFloat = 2
        let paddingWidth = 16 * (itemsPerRow + 1)
        let avaliableWidth = UIScreen.main.bounds.width - paddingWidth
        let itemWidth = avaliableWidth / itemsPerRow
        layout.itemSize = CGSize(width: itemWidth, height: 202)
        
        return layout
    }
    
    private func configureBaseCell(character: Character?, ip: IndexPath) -> CharCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: baseCellID, for: ip) as! CharCell
        
        if let imageData = character?.image {
            let image = UIImage(data: imageData)
            cell.image.image = image
        }
        cell.nameLabel.text = character?.name
        
        return cell
    }
    
}

//MARK: - data source
extension BaseCharListCollection {
    open override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    open override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataObject?.numberOfItems ?? 0
    }
    
    open override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch state {
        case .Loading:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: shimmerCellId, for: indexPath) as! ShimmerCell
            return cell
        case .Showing:
            let character = dataObject?.getChar(by: indexPath.row)
            return configureBaseCell(character: character, ip: indexPath)
        }

    }
}

