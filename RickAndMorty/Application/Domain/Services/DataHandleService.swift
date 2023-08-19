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

protocol IDetailedCharDataHandlerService {
    func convertNetEpisodesToDomain(netData: [NetEpisode]) -> [Episode]
}

struct DataHandleService {
    
}

//MARK: - char protocol
extension DataHandleService: ICharDataHandleService {
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
            let origin = netCharacter.origin
            
            let domainCharacter = Character(name: name, status: status, species: species, type: type, gender: gender, image: imageData, episodes: episode, origin: origin)
            characters.append(domainCharacter)
        }
        
        return characters
    }
}

//MARK: - detailed char protocol
extension DataHandleService: IDetailedCharDataHandlerService {
    func convertNetEpisodesToDomain(netData: [NetEpisode]) -> [Episode] {
        var domainEpisodes = [Episode]()
        var episodeCount = 1
        
        for netEpisode in netData {
            let name = netEpisode.name
            let episode = convertDate(date: netEpisode.episode, episodeNumber: episodeCount)
            episodeCount += 1
            let airDate = netEpisode.air_date
            let domainEpisode = Episode(name: name, airDate: airDate, episode: episode)
            domainEpisodes.append(domainEpisode)
        }
        
        return domainEpisodes
    }
    
    private func convertDate(date: String, episodeNumber: Int) -> String {
        var seasonNumber = date[date.index(date.startIndex, offsetBy: 2)]
        let validDate = "Episode: \(episodeNumber), Season: \(seasonNumber)"
        return validDate
    }
    
}
