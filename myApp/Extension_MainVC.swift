//
//  Extension_MainVC.swift
//  myApp
//
//  Created by Shamil Aglarov on 16.02.2023.
//

import UIKit

extension MainViewController {
    
    func viewsConfigure() {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemGreen
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .systemBlue
    }
    
    func elementsConfigure() {
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.borderStyle = .roundedRect
        loginTextField.font = .italicSystemFont(ofSize: 15)
        loginTextField.placeholder = "Enter login"
        addLefImageTo(textField: loginTextField, image: UIImage(named: "loginBackground")!)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.font = .italicSystemFont(ofSize: 15)
        passwordTextField.placeholder = "Enter password"
        addLefImageTo(textField: passwordTextField, image: UIImage(named: "passwordBackground")!)
    }
    
    func setScrollViewConstrains() {
                
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
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
                constant: 50
            ).isActive = true
                contentView.bottomAnchor
            .constraint(
                equalTo: scrollView.bottomAnchor
            ).isActive = true
                contentView.heightAnchor
            .constraint(equalToConstant: 600)
            .isActive = true
    }
    
    func setViewsConstraints() {
        
        let const: CGFloat = 20
        
        contentView.addSubview(loginTextField)
        loginTextField.leftAnchor
            .constraint(
                equalTo: contentView.safeAreaLayoutGuide.leftAnchor,
                constant: const
            ).isActive = true
        loginTextField.topAnchor
            .constraint(
                equalTo: contentView.topAnchor
            ).isActive = true
        loginTextField.rightAnchor
            .constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor,
                        constant: -const
            ).isActive = true
        loginTextField.heightAnchor
            .constraint(equalToConstant: 50).isActive = true
        
        contentView.addSubview(passwordTextField)
        passwordTextField.leadingAnchor
            .constraint(
                equalTo: loginTextField.leadingAnchor
            ).isActive = true
        passwordTextField.topAnchor
            .constraint(
                equalTo: loginTextField.bottomAnchor,
                constant: 25
            ).isActive = true
        passwordTextField.trailingAnchor
            .constraint(
                equalTo: loginTextField.trailingAnchor
            ).isActive = true
        passwordTextField.heightAnchor
            .constraint(equalToConstant: 50).isActive = true
    }
}
