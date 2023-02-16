//
//  Extension_MainVC.swift
//  myApp
//
//  Created by Shamil Aglarov on 16.02.2023.
//

import UIKit

extension MainViewController {
    
    func setScrollView() {
                
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
                equalTo: scrollView.topAnchor
            ).isActive = true
                contentView.bottomAnchor
            .constraint(
                equalTo: scrollView.bottomAnchor
            ).isActive = true
                contentView.heightAnchor
            .constraint(equalToConstant: 420)
            .isActive = true
    }
    
    func setupViews() {
        
        contentView.addSubview(loginTextField)
        loginTextField.centerXAnchor
            .constraint(
                equalTo: contentView.centerXAnchor
            ).isActive = true
        loginTextField.topAnchor
            .constraint(
                equalTo: contentView.topAnchor,
            constant: 50
            ).isActive = true
        loginTextField.widthAnchor
            .constraint(
                equalTo: contentView.widthAnchor, multiplier: 3/4
            ).isActive = true
        
        contentView.addSubview(passwordTextField)
        passwordTextField.centerXAnchor
            .constraint(
                equalTo: contentView.centerXAnchor
            ).isActive = true
        passwordTextField.topAnchor
            .constraint(
                equalTo: loginTextField.bottomAnchor,
                constant: 25
            ).isActive = true
        passwordTextField.widthAnchor
            .constraint(
                equalTo: contentView.widthAnchor, multiplier: 3/4
            ).isActive = true
    }
}
