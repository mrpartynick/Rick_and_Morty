//
//  OriginCell.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 18.08.2023.
//

import UIKit

class OriginCell: BaseCell {
    public static let id = "Origin"
    public let originNameLabel = BaseWhiteLabel(text: "Earth")
    public let planetLabel = BaseWhiteLabel(text: "Planet")
    
    private let labelsToViewPadding: CGFloat = 16
    
    private let image = PlanetView()
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - build Hierarchy
    private func buildHierarchy() {
        contentView.addSubview(image)
        contentView.addSubview(originNameLabel)
        contentView.addSubview(planetLabel)
    }
    
    //MARK: - set Constraints
    private func setConstraints() {
        image.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        image.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor).isActive = true
        image.heightAnchor.constraint(equalToConstant: 64).isActive = true
        image.widthAnchor.constraint(equalToConstant: 64).isActive = true
        
        originNameLabel.translatesAutoresizingMaskIntoConstraints = false
        originNameLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: labelsToViewPadding).isActive = true
        originNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: labelsToViewPadding).isActive = true
        
        planetLabel.translatesAutoresizingMaskIntoConstraints = false
        planetLabel.topAnchor.constraint(equalTo: originNameLabel.bottomAnchor, constant: 8).isActive = true
        planetLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: labelsToViewPadding).isActive = true
    }
}
