//
//  DetailedCharInteractor.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 19.08.2023.
//

import Foundation

protocol IDetailedCharInteractor: AnyObject {
    func requestForEpisodes()
}

class DetailedCharInteractor: IDetailedCharInteractor {
    weak var presenter: IDetailedCharInteractorOutput? = nil
    
    public func requestForEpisodes() {
        
    }
}
