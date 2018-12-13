//
//  PlayerTableViewCell.swift
//  Linchess
//
//  Created by Егор on 13/12/2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    
    public var viewModel: SearchTableViewCellModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            userName.text = viewModel.player
        }
    }
    
}
