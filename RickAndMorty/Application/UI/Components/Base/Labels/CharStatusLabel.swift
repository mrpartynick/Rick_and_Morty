//
//  CharStatusLabel.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 19.08.2023.
//

import UIKit

class CharStatusLabel: UILabel {
    
    private enum State: String {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "Unknown"
    }
    
    override var text: String? {
        didSet {
            state = State(rawValue: text ?? "Unknown" ) ?? .unknown
        }
    }
    
    private var state: State = .unknown {
        didSet {
            switch state {
            case .alive:
                textColor = R.Colors.greenLabel
            case .dead:
                textColor = .red
            default:
                textColor = R.Colors.lightGrayLabel
            }
        }
    }
    
}
