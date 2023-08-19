//
//  NetResult.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 19.08.2023.
//

import Foundation

struct CharRequestResult: Codable {
    var info: NetMetaInfo
    var results: [NetCharacter]
}
