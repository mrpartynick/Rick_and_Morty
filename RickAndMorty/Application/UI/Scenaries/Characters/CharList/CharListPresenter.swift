//
//  Presenter.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 19.08.2023.
//

import Foundation

protocol ICharListViewOutput: AnyObject {
    
}

protocol ICharListInteractorOutput: AnyObject {
    
}

class CharListPresenter: ICharListViewOutput, ICharListInteractorOutput {
    var interactor: ICharListInteractor
    weak var view: ICharListView? = nil
    
    init(interactor: ICharListInteractor) {
        self.interactor = interactor
    }
}
