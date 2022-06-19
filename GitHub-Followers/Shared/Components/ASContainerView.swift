//
//  ASContainerView.swift
//  GitHub-Followers
//
//  Created by Alan Silva on 19/06/22.
//

import UIKit

class ASContainerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure () {
        
        self.backgroundColor = .systemBackground
        self.layer.cornerRadius = 16
        self.layer.borderWidth  = 2
        self.layer.borderColor = UIColor.white.cgColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
