//
//  UIViewController+Ext.swift
//  GitHub-Followers
//
//  Created by Alan Silva on 19/06/22.
//

import UIKit

extension UIViewController {
    
    func presentASAlertOnMainThread (title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = ASAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
        
    }
}
