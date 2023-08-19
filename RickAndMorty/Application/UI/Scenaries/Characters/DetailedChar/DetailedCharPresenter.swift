//
//  DetailedCharPresenter.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 19.08.2023.
//

import Foundation

protocol IDetailedCharViewOutput: AnyObject {
    func viewDidLoad(with character: Character)
}

protocol IDetailedCharInteractorOutput: AnyObject {
    func requestDidFinish(withError: Bool, resultData: [Episode]?)
}

class DetailedCharPresenter: IDetailedCharViewOutput, IDetailedCharInteractorOutput {
    weak var view: IDetailedCharView? = nil
    public var interactor: IDetailedCharInteractor
    
    private var character: Character!
    
    init(interactor: IDetailedCharInteractor) {
        self.interactor = interactor
    }
    
    public func viewDidLoad(with character: Character) {
        self.character = character
        let episodes = character.episodes
        interactor.requestForEpisodes(episodes: episodes)
    }
    
    public func requestDidFinish(withError: Bool, resultData: [Episode]?) {
        if !withError {
            var dataObject = DetailedCharDataObject()
            dataObject.episodes = resultData
            dataObject.character = self.character
            DispatchQueue.main.async {
                self.view?.showCharacterInfo(from: dataObject)
            }
        }
    }

}
