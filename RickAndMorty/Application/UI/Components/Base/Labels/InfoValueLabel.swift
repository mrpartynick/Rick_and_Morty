//
//  InfoValueLabel.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 19.08.2023.
//

import UIKit

class InfoValueLabel: BaseWhiteLabel {
    
    override var text: String? {
        willSet {
            guard let newValue = newValue else {return}
            if newValue.isEmpty {
                text = "None"
            }
        }
    }
    
    init() {
        super.init(text: "None")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
