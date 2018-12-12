//
//  Game.swift
//  Linchess
//
//  Created by Егор on 12/12/2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import Foundation

struct Game: Decodable {
    let timeClass: String?
    let rated: Bool?
    let black: Player?
    let white: Player?
    
    private enum CodingKeys: String, CodingKey {
        case timeClass = "time_class"
        case rated
        case black
        case white
    }
}
