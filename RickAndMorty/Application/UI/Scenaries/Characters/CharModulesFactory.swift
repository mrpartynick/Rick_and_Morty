//
//  CharModulesFactory.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 19.08.2023.
//

import UIKit

class CharModulesFactory {
    public static func getCharListModule() -> CharListView {
        return CharListAssembly.getModule()
    }
}
