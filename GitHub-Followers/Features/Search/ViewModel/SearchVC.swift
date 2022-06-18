//
//  SearchVC.swift
//  GitHub-Followers
//
//  Created by Alan Silva on 18/06/22.
//

import UIKit

class SearchVC: UIViewController {

    var screen: SearchScreen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen = SearchScreen()
        self.screen?.setupTextFieldProtocol(delegate: self)
        self.view = screen
        createDismissKeyboardTapGesture()
        self.screen?.callToAcationButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
    }
    
    @objc func pushFollowerListVC () {
        
        if self.screen?.usernameTextField.text == nil || self.screen?.usernameTextField.text == "" {
            print("Usuario não informado!")
            
        } else {
            let followerListVC = FollowersListVC()
            followerListVC.username = self.screen?.usernameTextField.text
            followerListVC.title = self.screen?.usernameTextField.text
            navigationController?.pushViewController(followerListVC, animated: true)            
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.screen, action: #selector(UIView.endEditing))
        self.screen?.addGestureRecognizer(tap)
    }
    
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
