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
    func getChar(by index: Int) -> Character
}

//MARK: - realization
class CharDataObject: ICharDataObject {
    
    public var numberOfItems: Int {
        return characters.count
    }
    private let characters: [Character]
    
    init(characters: [Character]) {
        self.characters = characters
    }
    
    public func getChar(by index: Int) -> Character {
        return characters[index]
    }
}
