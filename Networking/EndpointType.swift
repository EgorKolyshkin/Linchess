//
//  EndpointType.swift
//  Linchess
//
//  Created by Егор on 06/12/2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import Foundation

enum ChessApi {
    case titledPlayers(abbreviation: String)
    case user(username: String)
}


extension ChessApi: EndpointType {
    var baseURL: URL {
        return URL(string: "https://api.chess.com/pub/")!
    }
    
    var path: String {
        switch self {
        case .titledPlayers(let abbreviation):
            return "titled/\(abbreviation)"
        case .user(let username):
            return "player/\(username)"
        }
    }
}
