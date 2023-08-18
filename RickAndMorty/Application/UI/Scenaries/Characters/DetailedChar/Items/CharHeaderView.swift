//
//  CharHeaderView.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 18.08.2023.
//

import UIKit

class CharHeaderView: UICollectionViewCell {
    
    public static let id = "Char"
    
    let image: UIImageView = {
        let imv = UIImageView()
        imv.translatesAutoresizingMaskIntoConstraints = false
        imv.image = UIImage(named: "Rick")
        return imv
    }()
    
    public let nameLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .white
        l.font =  UIFont(name: "Gilroy-SemiBold", size: 17)
        l.attributedText = NSMutableAttributedString(string: "Rick Sanchez", attributes: [NSAttributedString.Key.kern: -0.41])
        return l
    }()
    
    public let charStatusLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .white
        l.font =  UIFont(name: "Gilroy-SemiBold", size: 17)
        l.attributedText = NSMutableAttributedString(string: "Alive", attributes: [NSAttributedString.Key.kern: -0.41])
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildHierarchy()
        setConstraints()
    }
//
//    init() {
//        super.init(frame: .zero)
//
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildHierarchy() {
        addSubview(image)
        addSubview(nameLabel)
        addSubview(charStatusLabel)
    }
    
    private func setConstraints() {
        image.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        image.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        image.heightAnchor.constraint(equalToConstant: 140).isActive = true
        image.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 24).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        charStatusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        charStatusLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true 
    }
}
