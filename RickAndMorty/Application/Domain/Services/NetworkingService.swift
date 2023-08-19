//
//  NetworkingService.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 19.08.2023.
//

import Foundation

protocol ICharNetService {
    func getCharacters(completion: @escaping (Result<[Data], Error>) -> () )
}

protocol IEpisodesNetService {
    func getEpisodes(episodesStringUrls: [String], completion: @escaping (Result<[Data], Error>) -> () )
}

//MARK: - definition
class NetworkingService {
    private let numberOfPages = 42
    private let urlString = "https://rickandmortyapi.com/api/character"
    private let session = URLSession.shared
    private let episodesDispatchGroup = DispatchGroup()
}

//MARK: - chars service
extension NetworkingService: ICharNetService {
    public func getCharacters(completion: @escaping (Result<[Data], Error>) -> () ) {
        guard let request = getCharsRequest(by: urlString) else {return}
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else {return completion(.failure(error!))}
            completion(.success([data]))
        }
        
        task.resume()
    }
    
    private func getCharsRequest(by stringURL: String) -> URLRequest? {
        guard let url = URL(string: stringURL) else {return nil}
        let request = URLRequest(url: url)
        return request
    }
}

//MARK: - episodes service
extension NetworkingService: IEpisodesNetService {
    func getEpisodes(episodesStringUrls: [String], completion: @escaping (Result<[Data], Error>) -> ()) {
        guard let requests = getEpisodesRequests(episodes: episodesStringUrls) else {return}
        var dataArray: Array<Data> = .init()
        
        for request in requests {
            episodesDispatchGroup.enter()
            let task = session.dataTask(with: request) { data, response, error in
                defer {self.episodesDispatchGroup.leave()}
                guard let data = data else {return completion(.failure(error!))}
                dataArray.append(data)
            }
            
            task.resume()
        }
        
        episodesDispatchGroup.notify(queue: DispatchQueue.global(qos: .default)) {
            completion(.success(dataArray))
        }
    }
    
    private func getEpisodesRequests(episodes: [String]) -> [URLRequest]? {
        var requests = [URLRequest]()
        
        for stringURL in episodes {
            guard let url = URL(string: stringURL) else {return nil}
            let request = URLRequest(url: url)
            requests.append(request)
        }
        
        return requests
    }
}
