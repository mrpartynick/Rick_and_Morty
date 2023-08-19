//
//  DetailedCharInteractor.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 19.08.2023.
//

import Foundation

protocol IDetailedCharInteractor: AnyObject {
    func requestForEpisodes(episodes: [String])
}

class DetailedCharInteractor: IDetailedCharInteractor {
    weak var presenter: IDetailedCharInteractorOutput? = nil
    private let networkingService: IEpisodesNetService = NetworkingService()
    private let parsingService: IDetailedCharParsingService = ParsingService()
    private let dataHandleService: IDetailedCharDataHandlerService = DataHandleService()
    
    public func requestForEpisodes(episodes: [String]) {
        networkingService.getEpisodes(episodesStringUrls: episodes) {[weak self] result in
            guard let self = self else {return}
            switch result{
            case .success(let data):
                do {
                    let parsedEpisodes = try parsingService.parseEpisodes(from: data)
                    let domainEpisodes = dataHandleService.convertNetEpisodesToDomain(netData: parsedEpisodes)
                    presenter?.requestDidFinish(withError: false, resultData: domainEpisodes)
                } catch {
                    presenter?.requestDidFinish(withError: true, resultData: nil)
                }
            case .failure(let error):
                print(error)
                presenter?.requestDidFinish(withError: true, resultData: nil)
            }
        }
    }
}
