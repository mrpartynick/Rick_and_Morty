//
//  Labels.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 18.08.2023.
//

import UIKit

class BaseWhiteLabel: UILabel {
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        font = UIFont(name: "Gilroy-Medium", size: 16)
        textColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
