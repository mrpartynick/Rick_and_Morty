//
//  MockDataObject.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 18.08.2023.
//

import Foundation

class MockDataObject: ICharListDataObject {
    func getChar(by index: Int) -> Character {
        return Character(name: "", status: "", species: "", type: "", gender: "", image: nil, episodes: [String](), origin: NetOrigin(name: "kek"))
    }
    

    var numberOfItems: Int {
        return 10
    }
}
