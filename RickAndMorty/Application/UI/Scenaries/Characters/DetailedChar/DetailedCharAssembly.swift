//
//  DetailedCharAssembly.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 19.08.2023.
//

import Foundation

class DetailedCharAssembly {
    public static func getModule() -> DetailedCharView {
        let interactor = DetailedCharInteractor()
        let presenter = DetailedCharPresenter(interactor: interactor)
        let controller = DetailedCharView(presenter: presenter)

        presenter.view = controller
        interactor.presenter = presenter

        return controller
    }
}
