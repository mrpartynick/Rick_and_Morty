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
    
    private let modulesFactory = CharModulesFactory.self
    private var character: Character!
    
    public func start() {
        showCharListModule()
    }
    
    private func showCharListModule() {
        let module = modulesFactory.getCharListModule()
        
        module.completion = {[weak self] character in
            guard let self = self else {return}
            self.character = character
            showDetailedCharModule()
        }
        
        navigationController.pushViewController(module, animated: true)
    }
    
    private func showDetailedCharModule() {
        let module = DetailedCharView()
        print(self.character)
        module.character = self.character
        navigationController.pushViewController(module, animated: true)
    }
    
    
}
