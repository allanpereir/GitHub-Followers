//
//  ASAvatarImageView.swift
//  GitHub-Followers
//
//  Created by Alan Silva on 26/06/22.
//

import Foundation
import UIKit

class ASAvatarImageView: UIView {
    
    let placeholderImage = UIImage(named: "avatar-placeholder")
    
    lazy var avatarImageView: UIImageView = {
       let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.configure()
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        self.avatarImageView.layer.cornerRadius = 10
        self.avatarImageView.clipsToBounds = true
        self.avatarImageView.image = placeholderImage
    }
    
    func addSubviews() {
        addSubview(self.avatarImageView)
    }
}
