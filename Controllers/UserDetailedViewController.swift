//
//  UsedDetailedViewController.swift
//  Linchess
//
//  Created by Егор on 08/12/2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import UIKit

class UserDetailedViewController: UIViewController {
    
    @IBOutlet weak var activityIndicatorView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewBackgroundView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundView = tableViewBackgroundView
        avatarView.layer.cornerRadius = avatarView.bounds.width / 2
        avatarView.clipsToBounds = true
        makeUserRequest()
        makeUserGamesRequest()
    }
    
    private let networking = Networking()
    
    private var gameResponse: GameResonse? {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    
    public var avatarImageURL: URL? {
        didSet {
            fetchAvatarImage()
        }
    }
    
    private func makeUserRequest() {
        if let userName = userName {
            activityIndicator.startAnimating()
            networking.performNetworkTask(endpoint: ChessApi.user(username: userName), type: User.self)
            { [weak self] user in
                DispatchQueue.main.async {
                    self?.nameLabel.text = user.name ?? "User Name"
                    self?.followersLabel.text = "followers: " + String(describing: user.followers ?? 0)
                    self?.activityIndicator.stopAnimating()
                    self?.activityIndicatorView.isHidden = true
                    self?.avatarImageURL = user.avatar
                }
            }
        }
    }
    
    private func makeUserGamesRequest() {
        if let userName = userName {
            networking.performNetworkTask(endpoint: ChessApi.games(username: userName), type: GameResonse.self)
            { [weak self] gameResponse in
                DispatchQueue.main.async {
                    self?.gameResponse = gameResponse
                }
            }
        }
    }
    
    private var userName: String?
    
    private func fetchAvatarImage() {
        
        guard let url = self.avatarImageURL else { return }
        DispatchQueue.global(qos: .userInitiated).async {
            
            let data = try? Data(contentsOf: url)
            
            DispatchQueue.main.async {
                if let imageData = data {
                    self.avatarView.image = UIImage(data: imageData)
                }
            }
            
        }
        
    }
    
}


extension UserDetailedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameResponse?.games.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath)
        
        if let response = gameResponse {
            cell.textLabel?.text = response.games[indexPath.row].timeClass
        }
        return cell
    }
    
    
}
