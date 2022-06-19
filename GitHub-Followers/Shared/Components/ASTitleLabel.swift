//
//  ASTitleLabel.swift
//  GitHub-Followers
//
//  Created by Alan Silva on 19/06/22.
//

import UIKit

class ASTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(textAligment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.textColor = .label
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.9
        self.lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }

}
