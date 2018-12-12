//
//  GameResponse.swift
//  Linchess
//
//  Created by Егор on 12/12/2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import Foundation

struct GameResonse: Decodable {
    let games: [Game]
}
