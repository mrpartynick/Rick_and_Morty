//
//  ICharView.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 18.08.2023.
//

import UIKit

protocol ICharView {
    associatedtype T
    var completion: ((T) -> ())? {get set}
}
