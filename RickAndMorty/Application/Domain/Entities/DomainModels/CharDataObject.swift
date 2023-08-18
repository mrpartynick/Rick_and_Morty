//
//  CharDataObject.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 18.08.2023.
//

import Foundation

//MARK: - protocol
protocol ICharDataObject {
    var numberOfItems: Int {get}
}

//MARK: - realization
class CharDataObject: ICharDataObject {
    
    var numberOfItems: Int {
        return characters.count
    }
    
    private let characters = [Character]()
}
