//
//  User.swift
//  Linchess
//
//  Created by Егор on 08/12/2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import Foundation

struct User: Decodable {
    let username: String
    let status: String?
    let country: URL?
    let name: String?
    let followers: Int?
    let avatar: URL?
}
