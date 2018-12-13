//
//  SearchViewModel.swift
//  Linchess
//
//  Created by Егор on 13/12/2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import Foundation

class SearchViewModel {
    
    private let networking = Networking()
    private var titledPlayers: TitledPlayers?
    
    public var count: Int {
        return titledPlayers?.players.count ?? 0
    }
    
    public func getTitledUsers(for abbreviation: String, competion: (() -> Void)?) {
        networking.performNetworkTask(endpoint: ChessApi.titledPlayers(abbreviation: abbreviation), type: TitledPlayers.self) { [weak self] players in
            self?.titledPlayers = players
            competion?()
        }
    }
    
    public func cellViewModel(for index: Int) -> SearchTableViewCellModel? {
        guard let titled = titledPlayers else { return nil }
        let cellViewModel = SearchTableViewCellModel(with: titled.players[index])
        return cellViewModel
    }
}
