//
//  DetailedCharPresenter.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 19.08.2023.
//

import Foundation

protocol IDetailedCharViewOutput: AnyObject {
    func viewDidLoad()
}

protocol IDetailedCharInteractorOutput: AnyObject {
    
}

class DetailedCharPresenter: IDetailedCharViewOutput, IDetailedCharInteractorOutput {
    weak var view: IDetailedCharView? = nil
    public var interactor: IDetailedCharInteractor
    
    init(interactor: IDetailedCharInteractor) {
        self.interactor = interactor
    }
    
    public func viewDidLoad() {
        interactor.requestForEpisodes()
    }
}
