//
//  ShimmerCell.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 19.08.2023.
//

import UIKit

class ShimmerCell: BaseCell {
    public static let id = "shimmer"
    private let shimmerLayer = ShimmerLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 10
        shimmerLayer.cornerRadius = 10
        layer.addSublayer(shimmerLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        shimmerLayer.frame = contentView.bounds
    }
}
