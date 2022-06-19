//
//  ASAlertVCViewController.swift
//  GitHub-Followers
//
//  Created by Alan Silva on 19/06/22.
//

import UIKit

class ASAlertVC: UIViewController {

    let containerView = ASContainerView()
    let titleLabel    = ASTitleLabel(textAligment: .center, fontSize: 20)
    let messageLabel  = ASBodyLabel(textAligment: .center)
    let actionButton  = ASButton(backgroundColor: .systemPink, title: "OK")
    
    var alertTitle: String?
    var message: String?
    var buttonTittle: String?
    var padding: CGFloat = 20
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTittle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        self.configureContainerView()
        self.configureTitleLabel()
        self.configureActionButton()
        self.configureBodyLabel()
    }
    

    func configureContainerView() {
        self.view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            self.containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            self.containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.containerView.widthAnchor.constraint(equalToConstant: 280),
            self.containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    func configureTitleLabel() {
        self.containerView.addSubview(titleLabel)
        self.titleLabel.text = alertTitle ?? "Algo deu errado."
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant:  -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    func configureActionButton() {
        containerView.addSubview(actionButton)
        actionButton.setTitle(buttonTittle ?? "OK", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    func configureBodyLabel() {
        containerView.addSubview(messageLabel)
        messageLabel.text = message ?? "Impossivel de completar a solicitação!"
        messageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }

}
