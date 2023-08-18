//
//  BaseDetailedCharCollection.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 18.08.2023.
//

import UIKit

class BaseDetailedCharCollection: UICollectionViewController {
    
    private enum Sections: Int, CaseIterable {
        case character
        case info
        case origin
        case episodes
    }
    private let sideInsets: CGFloat = 16
    
    internal var dataObject = DataObject()

    
    init() {
        super.init(collectionViewLayout: UICollectionViewLayout())
        collectionView.collectionViewLayout = createLayout()
        registerItems()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - register items
    private func registerItems() {
        collectionView.register(CharHeaderView.self, forCellWithReuseIdentifier: CharHeaderView.id)
        collectionView.register(InfoCell.self, forCellWithReuseIdentifier: InfoCell.id)
        collectionView.register(OriginCell.self, forCellWithReuseIdentifier: OriginCell.id)
        collectionView.register(EpisodeCell.self, forCellWithReuseIdentifier: EpisodeCell.id)
        collectionView.register(SectionTitle.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionTitle.id)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor(red: 4/255, green: 10/255, blue: 25/255, alpha: 1)
    }
    
    //MARK: - create layout
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let section = Sections(rawValue: sectionIndex)
            
            switch section {
            case .character:
                let group = self.createGroup(height: 200)
                let section = self.createSection(group: group, topPadding: 0, bottomPadding: 52)
                return section
                
            case .info:
                let group = self.createGroup(height: 124)
                let section = self.createSection(group: group, topPadding: 16, bottomPadding: 24)
                section.boundarySupplementaryItems = [self.createHeader()]
                return section
                
            case .origin:
                let group = self.createGroup(height: 80)
                let section = self.createSection(group: group, topPadding: 16, bottomPadding: 24)
                section.boundarySupplementaryItems = [self.createHeader()]
                return section
                
            case .episodes:
                let group = self.createGroup(height: 86)
                let section = self.createSection(group: group, topPadding: 16, bottomPadding: 0)
                section.boundarySupplementaryItems = [self.createHeader()]
                section.interGroupSpacing = 16
                return section
                
            default:
                return nil
            }
            
        }
        
        return layout
    }
    
    //MARK: - create group
    private func createGroup(height: CGFloat) -> NSCollectionLayoutGroup {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(height))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        return group
    }
    
    //MARK: - create section
    private func createSection(group: NSCollectionLayoutGroup, topPadding: CGFloat, bottomPadding: CGFloat) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: topPadding, leading: self.sideInsets, bottom: bottomPadding, trailing: self.sideInsets)
        return section
    }
    
    //MARK: - create header
    private func createHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return header
    }
}

//MARK: - data source
extension BaseDetailedCharCollection {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataObject.numbersOfSections
    }
    
    //MARK: - number of item
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let namedSection = Sections(rawValue: section)
        switch namedSection {
        case .episodes:
            return dataObject.numberOfEpisodes
        default:
            return 1
        }
    }
    
    //MARK: - cell for item
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = Sections(rawValue: indexPath.section)
        
        switch section {
        case .character:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharHeaderView.id, for: indexPath) as! CharHeaderView
            return cell
            
        case .info:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoCell.id, for: indexPath) as! InfoCell
            return cell
            
        case .origin:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OriginCell.id, for: indexPath) as! OriginCell
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodeCell.id, for: indexPath) as! EpisodeCell
            return cell
        }

    }
    
    //MARK: - suuplementary view 
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionTitle = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionTitle.id, for: indexPath) as! SectionTitle
        sectionTitle.title = "kek"
        print(sectionTitle.title)
        return sectionTitle
    }
}
