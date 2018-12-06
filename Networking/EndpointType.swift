//
//  EndpointType.swift
//  Linchess
//
//  Created by Егор on 06/12/2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import Foundation

enum LichessApi {
    case user(user: String)
    case streamers()
}


extension LichessApi: EndpointType {
    var baseURL: URL {
        return URL(string: "https://lichess.org/")!
    }
    
    var path: String {
        switch self {
        case .user(let userName):
            return "api/user/\(userName)"
        case .streamers():
            return "streamer/live"
        }
    }
}
