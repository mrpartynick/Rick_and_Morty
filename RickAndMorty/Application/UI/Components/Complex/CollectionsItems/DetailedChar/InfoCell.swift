//
//  InfoItem.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 18.08.2023.
//

import UIKit

class InfoCell: BaseCell {
    public static let id = "Info"
    
    private let labelPadding: CGFloat = 16
    
    private var speciesLabel: BaseWhiteLabel!
    private var typeLabel: BaseWhiteLabel!
    private var genderLabel: BaseWhiteLabel!
    
    public var speciesValueLabel = InfoValueLabel()
    public var typeValueLabel = InfoValueLabel()
    public var genderValueLabel = InfoValueLabel()
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureLabels()
        buildHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - configure labels
    private func configureLabels() {
        speciesLabel = configureInfoLabel(text: "Species:")
        typeLabel = configureInfoLabel(text: "Type:")
        genderLabel = configureInfoLabel(text: "Gender:")
        
        speciesValueLabel.translatesAutoresizingMaskIntoConstraints = false
        typeValueLabel.translatesAutoresizingMaskIntoConstraints = false
        genderValueLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    //MARK: - configure info label
    private func configureInfoLabel(text: String) -> BaseWhiteLabel {
        let label = BaseWhiteLabel(text: text)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = R.Colors.lightGrayLabel
        return label
    }
    
    //MARK: - build hierarchy
    private func buildHierarchy() {
        contentView.addSubview(speciesLabel)
        contentView.addSubview(typeLabel)
        contentView.addSubview(genderLabel)
        contentView.addSubview(speciesValueLabel)
        contentView.addSubview(typeValueLabel)
        contentView.addSubview(genderValueLabel)
    }
    
    //MARK: - set constraints
    private func setConstraints() {
        speciesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: labelPadding).isActive = true
        speciesLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: labelPadding).isActive = true
        
        typeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: labelPadding).isActive = true
        typeLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: labelPadding).isActive = true
        
        genderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: labelPadding).isActive = true
        genderLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: labelPadding).isActive = true
        genderLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: labelPadding).isActive = true
        
        speciesValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -labelPadding).isActive = true
        speciesValueLabel.lastBaselineAnchor.constraint(equalTo: speciesLabel.lastBaselineAnchor).isActive = true

        typeValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -labelPadding).isActive = true
        typeValueLabel.lastBaselineAnchor.constraint(equalTo: typeLabel.lastBaselineAnchor).isActive = true

        genderValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -labelPadding).isActive = true
        genderValueLabel.lastBaselineAnchor.constraint(equalTo: genderLabel.lastBaselineAnchor).isActive = true
    }
    
    
}
