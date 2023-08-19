//
//  CharListInteractor.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 19.08.2023.
//

import Foundation

protocol ICharListInteractor: AnyObject {
    
}

class CharListInteractor: ICharListInteractor {
    weak var presenter: ICharListInteractorOutput? = nil
}
