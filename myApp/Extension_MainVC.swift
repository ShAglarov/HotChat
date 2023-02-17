//
//  Extension_MainVC.swift
//  myApp
//
//  Created by Shamil Aglarov on 16.02.2023.
//

import UIKit

extension MainViewController {
    
    func viewsConfigure() {
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "viewBackground")!)
        
        imageVeiw.image = UIImage(named: "headerBackground")
        imageVeiw.contentMode = .topRight
        
        imageVeiw.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = UIColor(patternImage: UIImage(named: "scrollViewBackground")!)
    }
    
    func elementsConfigure() {
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.borderStyle = .roundedRect
        loginTextField.font = .italicSystemFont(ofSize: 15)
        loginTextField.placeholder = "Enter login"
        loginTextField.backgroundColor = UIColor(patternImage: UIImage(named: "textFieldBackground")!)
        loginTextField.textColor = .darkText
        addLefImageTo(textField: loginTextField, image: UIImage(named: "loginBackground")!)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.font = .italicSystemFont(ofSize: 15)
        passwordTextField.placeholder = "Enter password"
        passwordTextField.backgroundColor = UIColor(patternImage: UIImage(named: "textFieldBackground")!)
        passwordTextField.textColor = .darkText
        addLefImageTo(textField: passwordTextField, image: UIImage(named: "passwordBackground")!)
        
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        enterButton.layer.cornerRadius = 5
        enterButton.setTitle("Log in", for: .normal)
        enterButton.tintColor = .darkText
        enterButton.backgroundColor = UIColor(patternImage: UIImage(named: "buttonBackground")!)
        
    }
    
    func setScrollViewConstrains() {
                
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.layer.cornerRadius = 10
        
        scrollView.centerXAnchor
            .constraint(
                equalTo: view.centerXAnchor
            ).isActive = true
        
        scrollView.widthAnchor
            .constraint(
                equalTo: view.widthAnchor
            ).isActive = true
        
        scrollView.topAnchor
            .constraint(
                equalTo: view.topAnchor
            ).isActive = true
        
        scrollView.bottomAnchor
            .constraint(
                equalTo: view.bottomAnchor
            ).isActive = true
        
        contentView.centerXAnchor
            .constraint(
                equalTo: scrollView.centerXAnchor
            ).isActive = true
                contentView.widthAnchor
            .constraint(
                equalTo: scrollView.widthAnchor
            ).isActive = true
                contentView.topAnchor
            .constraint(
                equalTo: scrollView.topAnchor,
                constant: 130
            ).isActive = true
                contentView.bottomAnchor
            .constraint(
                equalTo: scrollView.bottomAnchor
            ).isActive = true
                contentView.heightAnchor
            .constraint(equalToConstant: 523)
            .isActive = true
    }
    
    func setViewElementsConstraints() {
        
        let const: CGFloat = 20
        
        scrollView.insertSubview(imageVeiw, at: 0)
        imageVeiw.centerXAnchor
            .constraint(
                equalTo: scrollView.safeAreaLayoutGuide.centerXAnchor
            ).isActive = true
        imageVeiw.topAnchor
            .constraint(
                equalTo: scrollView.topAnchor,
                constant: -const
            ).isActive = true
        imageVeiw.bottomAnchor
            .constraint(
                equalTo: scrollView.bottomAnchor
            ).isActive = true
        
        contentView.addSubview(loginTextField)
        loginTextField.leftAnchor
            .constraint(
                equalTo: contentView.safeAreaLayoutGuide.leftAnchor,
                constant: const
            ).isActive = true
        loginTextField.topAnchor
            .constraint(
                equalTo: contentView.topAnchor,
                constant: 25
            ).isActive = true
        loginTextField.rightAnchor
            .constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor,
                        constant: -const
            ).isActive = true
        loginTextField.heightAnchor
            .constraint(equalToConstant: 60).isActive = true
        
        contentView.addSubview(passwordTextField)
        passwordTextField.leadingAnchor
            .constraint(
                equalTo: loginTextField.leadingAnchor
            ).isActive = true
        passwordTextField.topAnchor
            .constraint(
                equalTo: loginTextField.bottomAnchor,
                constant: 13
            ).isActive = true
        passwordTextField.trailingAnchor
            .constraint(
                equalTo: loginTextField.trailingAnchor
            ).isActive = true
        passwordTextField.heightAnchor
            .constraint(equalToConstant: 60).isActive = true
        
        contentView.addSubview(enterButton)
        NSLayoutConstraint.activate([
            enterButton.leadingAnchor
                .constraint(
                    equalTo: passwordTextField.leadingAnchor
                ),
            enterButton.topAnchor
                .constraint(
                    equalTo: passwordTextField.bottomAnchor,
                    constant: 13
                ),
            enterButton.trailingAnchor
                .constraint(
                    equalTo: passwordTextField.trailingAnchor
                ),
            enterButton.heightAnchor
                .constraint(equalToConstant: 50)
        ])
    }
}
