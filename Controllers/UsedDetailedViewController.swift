//
//  UsedDetailedViewController.swift
//  Linchess
//
//  Created by Егор on 08/12/2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import UIKit

class UsedDetailedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
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
