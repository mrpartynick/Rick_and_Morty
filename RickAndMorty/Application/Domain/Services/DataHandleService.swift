//
//  DataHandleService.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 19.08.2023.
//

import Foundation

protocol ICharDataHandleService {
    func convertNetCharsToDomain(netData: [NetCharacter]) -> [Character]
}

struct DataHandleService: ICharDataHandleService {
    
    public func convertNetCharsToDomain(netData: [NetCharacter]) -> [Character] {
        var characters = [Character]()
        for netCharacter in netData {
            let name = netCharacter.name
            let status = netCharacter.status
            let species = netCharacter.species
            let type = netCharacter.type
            let gender = netCharacter.gender
            let imageData = try? Data(contentsOf: URL(string: netCharacter.image)!)
            let episode = netCharacter.episode
            
            let domainCharacter = Character(name: name, status: status, species: species, type: type, gender: gender, image: imageData, episodes: episode)
            characters.append(domainCharacter)
        }
        
        return characters
    }
}
