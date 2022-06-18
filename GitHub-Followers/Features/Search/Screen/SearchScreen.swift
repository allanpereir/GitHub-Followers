//
//  SearchScreen.swift
//  GitHub-Followers
//
//  Created by Alan Silva on 18/06/22.
//

import UIKit

class SearchScreen: UIView {
    
    let callToAcationButton = ASButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "gh-logo")!
        return imageView
    }()
    
    lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth  = 2
        textField.layer.borderColor  = UIColor.systemGray4.cgColor
        textField.textColor = .label
        textField.tintColor = .label
        textField.textAlignment = .center
        textField.font = UIFont.preferredFont(forTextStyle: .title2)
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 12
        textField.backgroundColor = .tertiarySystemBackground
        textField.autocorrectionType = .no
        textField.placeholder = "Entre com o nome do usuario!"
        textField.returnKeyType = .go
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        self.addSubviews()
        self.configConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews (){
        self.addSubview(logoImageView)
        self.addSubview(usernameTextField)
        self.addSubview(callToAcationButton)
        self.addSubview(usernameTextField)
    }
    
    func setupTextFieldProtocol(delegate: UITextFieldDelegate) {
        self.usernameTextField.delegate = delegate        
    }
    
    func configConstrains() {
        
        logoImageView.image = UIImage(named: "gh-logo")!
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            callToAcationButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToAcationButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            callToAcationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            callToAcationButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
