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

struct ParsingService: ICharParsingService {
    public func parseCharacters(from data: Data) throws -> [NetCharacter] {
        let parsedResult = try JSONDecoder().decode(CharRequestResult.self, from: data)
        let characters = parsedResult.results
        return characters
    }
}
