//
//  Character.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 18.08.2023.
//

import Foundation

class Character {
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var image: Data?
    var episodes: [String]
    
    init(name: String, status: String, species: String, type: String, gender: String, image: Data?, episodes: [String]) {
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.image = image
        self.episodes = episodes
    }
}
