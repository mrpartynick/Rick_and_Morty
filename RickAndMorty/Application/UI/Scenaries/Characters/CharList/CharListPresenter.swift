//
//  Presenter.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 19.08.2023.
//

import Foundation

//MARK: - view out
protocol ICharListViewOutput: AnyObject {
    func viewDidLoad()
}

//MARK: - interactor out
protocol ICharListInteractorOutput: AnyObject {
    func charRequestDidFinish(withError: Bool, data: [Character]?)
}

//MARK: - realization
class CharListPresenter: ICharListViewOutput, ICharListInteractorOutput {
    
    var interactor: ICharListInteractor
    weak var view: ICharListView? = nil
    
    init(interactor: ICharListInteractor) {
        self.interactor = interactor
    }
    
    public func viewDidLoad() {
        interactor.getCharacters()
    }
    
    public func charRequestDidFinish(withError: Bool, data: [Character]?) {
        if !withError {
            let data = data!
            let dataObject = CharDataObject(characters: data)
            DispatchQueue.main.async {
                self.view?.showCharacters(from: dataObject)
            }
        }
    }
}
