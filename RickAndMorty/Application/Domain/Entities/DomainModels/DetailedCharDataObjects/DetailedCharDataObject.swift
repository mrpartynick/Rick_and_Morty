//
//  DetailedCharDataObject.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 19.08.2023.
//

import Foundation

struct DetailedCharDataObject {
    var character: Character?
    var episodes: [Episode]?
    
    public var numberOfSections = 4
    public var numberOfEpisodes: Int {
        return episodes?.count ?? 0
    }
}
