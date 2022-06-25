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
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
    }
    override func viewWillAppear(_ animated: Bool) {
        //navigationController?.isNavigationBarHidden = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
