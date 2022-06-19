//
//  ASAlert.swift
//  GitHub-Followers
//
//  Created by Alan Silva on 19/06/22.
//

import UIKit

class ASAlertScreen: UIView {
    
    let containerView = UIView()
    var actionButtton = ASButton(backgroundColor: .systemPink, title: "OK")
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var messageLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints =  false
        return label
    }()
    
    init(textAlignmentTitle: NSTextAlignment,fontSizeTitle: CGFloat, title: String, message: String, buttonTitle: String) {
        super.init(frame: .zero)
        self.titleLabel.text = title
        self.messageLabel.text = message
        self.titleLabel.textAlignment = textAlignmentTitle
        self.titleLabel.font = UIFont.systemFont(ofSize: fontSizeTitle, weight: .bold)
        self.actionButtton = ASButton(backgroundColor: .systemPink, title: buttonTitle)
        
        self.addSubviews()
        self.setupAlert()
        self.configConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupAlert (){
        
        containerView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .systemBackground
        
        self.titleLabel.textColor = .label
        self.titleLabel.adjustsFontSizeToFitWidth = true
        self.titleLabel.minimumScaleFactor = 0.9
        self.titleLabel.lineBreakMode = .byTruncatingTail
        
        self.messageLabel.textColor = .secondaryLabel
        self.messageLabel.adjustsFontSizeToFitWidth = true
        self.messageLabel.minimumScaleFactor = 0.75
        self.messageLabel.lineBreakMode = .byWordWrapping
    }
    
    func addSubviews(){
        containerView.addSubview(titleLabel)
        containerView.addSubview(messageLabel)
        containerView.addSubview(actionButtton)
        self.addSubview(containerView)
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            self.containerView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.containerView.widthAnchor.constraint(equalToConstant: 280),
            self.containerView.heightAnchor.constraint(equalToConstant: 220),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 20),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 20),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -20),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 28),
            
            self.messageLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 5),
            self.messageLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 5),
            self.messageLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -5),
            
            self.actionButtton.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -20),
            self.actionButtton.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 20),
            self.actionButtton.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: 20),
            self.actionButtton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
