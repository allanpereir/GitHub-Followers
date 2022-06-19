//
//  ASBodyLabel.swift
//  GitHub-Followers
//
//  Created by Alan Silva on 19/06/22.
//

import UIKit

class ASBodyLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAligment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = textAligment
        configure()
    }
    
    private func configure () {
        self.textColor = .secondaryLabel
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.75
        self.lineBreakMode = .byWordWrapping
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont.preferredFont(forTextStyle: .body)
    }
    
}
