//
//  ParsingService.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 19.08.2023.
//

import Foundation

protocol ICharParsingService {
    func parseCharacters(from data: Data) throws -> [NetCharacter]
}

protocol IDetailedCharParsingService {
    func parseEpisodes(from data: [Data]) throws -> [NetEpisode]
}

struct ParsingService {

}

extension ParsingService: ICharParsingService {
    public func parseCharacters(from data: Data) throws -> [NetCharacter] {
        let parsedResult = try JSONDecoder().decode(CharRequestResult.self, from: data)
        let characters = parsedResult.results
        return characters
    }
}

extension ParsingService: IDetailedCharParsingService {
    public func parseEpisodes(from data: [Data]) throws -> [NetEpisode] {
        var parsedEpisodes = [NetEpisode]()
        
        for episodeData in data {
            let parsedEpisode = try JSONDecoder().decode(NetEpisode.self, from: episodeData)
            parsedEpisodes.append(parsedEpisode)
        }
        
        return parsedEpisodes
    }
    
    
}
