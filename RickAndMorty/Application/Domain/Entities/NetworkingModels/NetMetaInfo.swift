//
//  NetMetaInfo.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 19.08.2023.
//

import Foundation

struct NetMetaInfo: Codable {
    var count: Int
    var pages: Int
    var next: String
    var prev: String?
}
