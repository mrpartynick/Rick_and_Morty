//
//  CharListAssembly.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 19.08.2023.
//

import UIKit

class CharListAssembly {
    public static func getModule() -> CharListView {
        let interactor = CharListInteractor()
        let presenter = CharListPresenter(interactor: interactor)
        let controller = CharListView(presenter: presenter)

        presenter.view = controller
        interactor.presenter = presenter

        return controller
    }
}
