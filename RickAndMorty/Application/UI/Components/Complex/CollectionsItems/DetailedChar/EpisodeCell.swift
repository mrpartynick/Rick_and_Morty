//
//  EpisodeCell.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 18.08.2023.
//

import UIKit

class EpisodeCell: BaseCell {
    public static let id = "Episode"
    
    public let nameLabel = BaseWhiteLabel(text: "Pilot")
    public let infoLabel = BaseWhiteLabel(text: "Episode: 1, Season: 1")
    public let dateLabel = BaseWhiteLabel(text: "December 2, 2013")
    
    private let labelsPadding: CGFloat = 16
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        nameLabel.font = UIFont(name: R.Fonts.gilroySemibold, size: 17)
        infoLabel.font = UIFont(name: R.Fonts.gilroyMedium, size: 13)
        infoLabel.textColor = R.Colors.greenLabel
        dateLabel.font = UIFont(name: R.Fonts.gilroyMedium, size: 12)
        dateLabel.textColor = R.Colors.dateLabel
        
        addSubview(nameLabel)
        addSubview(infoLabel)
        addSubview(dateLabel)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setConstraints
    private func setConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: labelsPadding).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: labelsPadding).isActive = true
        nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor).isActive = true 
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: labelsPadding).isActive = true
        infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: labelsPadding).isActive = true
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.firstBaselineAnchor.constraint(equalTo: infoLabel.firstBaselineAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
    }
}
