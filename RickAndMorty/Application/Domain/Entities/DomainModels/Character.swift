//
//  Character.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 18.08.2023.
//

import Foundation

struct Character {
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var image: Data?
    var episodes: [String]
    var origin: NetOrigin
    var domainEpisodes = [Episode]()
    
    init(name: String, status: String, species: String, type: String, gender: String, image: Data?, episodes: [String], origin: NetOrigin) {
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.image = image
        self.episodes = episodes
        self.origin = origin
    }
}
