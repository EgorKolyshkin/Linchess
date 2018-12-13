//
//  SearchTableViewCellModel.swift
//  Linchess
//
//  Created by Егор on 13/12/2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import Foundation


class SearchTableViewCellModel {
    
    private let titledPlayers: String
    
    init(with titledPlayers: String) {
        self.titledPlayers = titledPlayers
    }
    
    public var player: String {
        return titledPlayers
    }
}
