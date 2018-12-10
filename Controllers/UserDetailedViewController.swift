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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarView.layer.cornerRadius = avatarView.bounds.width / 2
        avatarView.clipsToBounds = true
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
    
    private let networking = Networking()
    
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    
    public var avatarImageURL: URL? {
        didSet {
            fetchAvatarImage()
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
    
    public var user: String {
        set {
            self.userName = newValue
        }
        get {
            return userName ?? "User Name"
        }
    }
    
}
