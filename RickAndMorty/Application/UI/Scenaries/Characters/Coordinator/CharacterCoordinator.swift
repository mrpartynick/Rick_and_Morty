//
//  CharacterCoordinator.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 18.08.2023.
//

import UIKit

//MARK: - protocol
protocol ICharacterCoordinator {
    var navigationController: UINavigationController {get}
    func start()
}

//MARK: - realization
class CharacterCoordinator: ICharacterCoordinator {
    
    var navigationController: UINavigationController {
        get {
            return _navigationController
        }
    }
    
    private var _navigationController: UINavigationController = {
        let nav = UINavigationController()
        nav.navigationBar.prefersLargeTitles = true
        nav.navigationBar.tintColor = .white
        nav.navigationBar.barStyle = .black
        return nav
    }()
    
    public func start() {
        showCharListModule()
    }
    
    private func showCharListModule() {
        let module = CharListView(presenter: nil)
        
        module.completion = {[weak self] character in
            guard let self = self else {return}
            showDetailedCharModule()
        }
        
        navigationController.pushViewController(module, animated: true)
    }
    
    private func showDetailedCharModule() {
        let module = DetailedCharView()
        navigationController.pushViewController(module, animated: true)
    }
    
    
}
