//
//  CharCell.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 18.08.2023.
//

import UIKit

class CharCell: BaseCell {
    public let image = UIImageView()
    
    public let nameLabel = BaseWhiteLabel(text: "Rick Sanchez")
    public static let id = "CharCell"
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: .zero)

        image.layer.cornerRadius = 10
        image.image = UIImage(named: "Rick")
        buildHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - build hierarchy
    private func buildHierarchy() {
        contentView.addSubview(image)
        contentView.addSubview(nameLabel)
    }
    
    //MARK: - set constarints
    private func setConstraints() {
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
        image.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16).isActive = true
    }
}
