//
//  TitileHeader.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 18.08.2023.
//

import UIKit

class TitleHeader: UIView {
    let title: UILabel = {
        let l = UILabel()
        l.text = "info"
        l.textColor = .white
        return l
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(red: 4/255, green: 10/255, blue: 25/255, alpha: 1)
        
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
