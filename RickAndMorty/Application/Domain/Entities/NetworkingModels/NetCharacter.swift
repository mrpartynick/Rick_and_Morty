//
//  NetCharacter.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 19.08.2023.
//

import Foundation

struct NetCharacter: Codable {
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var image: String
    var episode: [String]
    var origin: NetOrigin
}
