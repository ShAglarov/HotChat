//
//  Extension_MainVC.swift
//  myApp
//
//  Created by Shamil Aglarov on 16.02.2023.
//

import UIKit

extension MainViewController {
    
    // прячем клавиатуру при нажатии на область Scroll View
    @objc func hideKeyboardAfterTouchScreen() {
        view.endEditing(true)
    }
    
    // когда клавиатура появляетя
    @objc func keyboardWasShown(notification: Notification) {
        
        guard UIDevice.current.orientation.isLandscape else { return }
        scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.bounds.height / 3.3), animated: true)
    }
    
    // когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        guard UIDevice.current.orientation.isLandscape else { return }
        let controlInsets = UIEdgeInsets.zero
        scrollView.contentInset = controlInsets
        scrollView.setContentOffset(CGPoint(x: 0, y: -1), animated: true)
    }
    
    func viewsConfigure() {
        
        view.backgroundColor = UIColor(
            patternImage: UIImage(named: "viewBackground")!
        )
        
        imageVeiw.image = UIImage(named: "headerBackground")
        imageVeiw.contentMode = .topRight
        imageVeiw.translatesAutoresizingMaskIntoConstraints = false
        
        tapGesture.addTarget(self, action: #selector(hideKeyboardAfterTouchScreen))
        view.addGestureRecognizer(tapGesture)
        
        scrollView.viewConfigure(addSubview: view,
                                      cornerRadius: nil,
                                      visible: true,
                                      backGroundColor: nil
        )
        
        contentView.viewConfigure(addSubview: scrollView,
                                       cornerRadius: 10,
                                       visible: true,
                                       backGroundColor: UIColor(
                                        patternImage: UIImage(named: "scrollViewBackground")!)
        )
    }
    
    func elementsConfigure() {

        loginTextField.borderStyle = .roundedRect
        
        loginTextField.textFieldConfigure(
            leftImageViewNamed: "loginBackground",
            textPlaceholder: "Enter login",
            textColor: .darkText,
            font: .italicSystemFont(ofSize: 15),
            addSubview: contentView,
            cornerRadius: nil,
            visible: true,
            backGroundColor: UIColor(patternImage:
                                        UIImage(named: "textFieldBackground")!
                                    )
        )
        
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        
        passwordTextField.textFieldConfigure(
            leftImageViewNamed: "passwordBackground",
            textPlaceholder: "Enter password",
            textColor: .darkText,
            font: .italicSystemFont(ofSize: 15),
            addSubview: contentView,
            cornerRadius: nil,
            visible: true,
            backGroundColor: UIColor(patternImage:
                                        UIImage(named: "textFieldBackground")!
                                    )
        )
        
        enterButton.buttonConfigure(addSubview: contentView,
                                         title: "Log in",
                                         cornerRadius: 5,
                                         visible: true,
                                         backGroundColor: UIColor(
                                            patternImage: UIImage(named: "buttonBackground")!),
                                         tintColor: .darkText)
        
        registrationButton.buttonConfigure(addSubview: contentView,
                                         title: "Register account",
                                         cornerRadius: 20,
                                         visible: true,
                                         backGroundColor: UIColor(
                                            patternImage: UIImage(named: "buttonBackground")!),
                                         tintColor: .darkText)
    }
    
    func setScrollViewConstrains() {
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor
                .constraint(
                    equalTo: view.centerXAnchor
                ),
            scrollView.widthAnchor
                .constraint(
                    equalTo: view.widthAnchor
                ),
            scrollView.topAnchor
                .constraint(
                    equalTo: view.topAnchor
                ),
            scrollView.bottomAnchor
                .constraint(
                    equalTo: view.bottomAnchor
                ),
            
            contentView.centerXAnchor
                .constraint(
                    equalTo: scrollView.centerXAnchor
                ),
            contentView.widthAnchor
                .constraint(
                    equalTo: scrollView.widthAnchor
                ),
            contentView.topAnchor
                .constraint(
                    equalTo: scrollView.topAnchor,
                    constant: 130
                ),
            contentView.bottomAnchor
                .constraint(
                    equalTo: scrollView.bottomAnchor
                ),
            contentView.heightAnchor
                .constraint(
                    equalToConstant: 523
                )
        ])
    }
    
    func setViewElementsConstraints() {
        
        let const: CGFloat = 20
        
        scrollView.insertSubview(imageVeiw, at: 0)
        
        NSLayoutConstraint.activate([
            imageVeiw.centerXAnchor
                .constraint(
                    equalTo: scrollView.safeAreaLayoutGuide.centerXAnchor
                ),
            imageVeiw.topAnchor
                .constraint(
                    equalTo: scrollView.topAnchor,
                    constant: -const
                ),
            imageVeiw.bottomAnchor
                .constraint(
                    equalTo: scrollView.bottomAnchor
                ),
            
            loginTextField.leftAnchor
                .constraint(
                    equalTo: contentView.safeAreaLayoutGuide.leftAnchor,
                    constant: const
                ),
            loginTextField.topAnchor
                .constraint(
                    equalTo: contentView.topAnchor,
                    constant: 25
                ),
            loginTextField.rightAnchor
                .constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor,
                            constant: -const
                ),
            loginTextField.heightAnchor
                .constraint(
                    equalToConstant: 60
                ),
            passwordTextField.leadingAnchor
                .constraint(
                    equalTo: loginTextField.leadingAnchor
                ),
            passwordTextField.topAnchor
                .constraint(
                    equalTo: loginTextField.bottomAnchor,
                    constant: 13
                ),
            passwordTextField.trailingAnchor
                .constraint(
                    equalTo: loginTextField.trailingAnchor
                ),
            passwordTextField.heightAnchor
                .constraint(equalToConstant: 60),
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
                .constraint(equalToConstant: 50),
            registrationButton.leadingAnchor
                .constraint(
                    equalTo: enterButton.leadingAnchor,
                    constant: 50
                ),
            registrationButton.trailingAnchor
                .constraint(
                    equalTo: enterButton.trailingAnchor,
                    constant: -50
                ),
            registrationButton.bottomAnchor
                .constraint(
                    equalTo: contentView.bottomAnchor,
                    constant: -10
                ),
            registrationButton.heightAnchor
                .constraint(equalToConstant: 35)
        ])
    }
}
