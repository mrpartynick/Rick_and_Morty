//
//  CharListInteractor.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 19.08.2023.
//

import Foundation

protocol ICharListInteractor: AnyObject {
    func getCharacters()
}

class CharListInteractor: ICharListInteractor {
    weak var presenter: ICharListInteractorOutput? = nil
    
    private let netService: ICharNetService = NetworkingService()
    private let parsingService: ICharParsingService = ParsingService()
    private let dataHandleService: ICharDataHandleService = DataHandleService()
    
    func getCharacters() {
        netService.getCharacters {[weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let data):
                do {
                    let parsedData = try parsingService.parseCharacters(from: data[0])
                    let characters = dataHandleService.convertNetCharsToDomain(netData: parsedData)
                    presenter?.charRequestDidFinish(withError: false, data: characters)
                } catch {
                    print(error)
                    presenter?.charRequestDidFinish(withError: true, data: nil)
                }
            case .failure(let error):
                print(error)
                presenter?.charRequestDidFinish(withError: true, data: nil)
            }
        }
    }
}
