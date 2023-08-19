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
    
}

struct NetworkingService {
    private let numberOfPages = 42
    private let urlString = "https://rickandmortyapi.com/api/character"
    private let session = URLSession.shared
    
    private func getRequest(by stringURL: String) -> URLRequest? {
        guard let url = URL(string: stringURL) else {return nil}
        let request = URLRequest(url: url)
        return request
    }
}

//MARK: - char service
extension NetworkingService: ICharNetService {
    public func getCharacters(completion: @escaping (Result<[Data], Error>) -> () ) {
        guard let request = getRequest(by: urlString) else {return}
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else {return completion(.failure(error!))}
            completion(.success([data]))
        }
        
        task.resume()
    }
}
