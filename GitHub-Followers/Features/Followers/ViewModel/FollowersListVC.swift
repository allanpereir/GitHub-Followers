//
//  FollowerListVC.swift
//  GitHub-Followers
//
//  Created by Alan Silva on 18/06/22.
//

import UIKit

class FollowersListVC: UIViewController {
    
    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
    }
}
