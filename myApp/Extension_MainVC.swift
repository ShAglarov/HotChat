//
//  Extension_MainVC.swift
//  myApp
//
//  Created by Shamil Aglarov on 16.02.2023.
//

import UIKit

extension MainViewController {
    
    // прячем клавиатуру при нажатии на область Scroll View
    @objc func hideKeyboardAfterTounchScreen() {
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
        
        tapGesture.addTarget(self, action: #selector(hideKeyboardAfterTounchScreen))
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
            ImageViewNamed: "loginBackground",
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
            ImageViewNamed: "passwordBackground",
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
    }
    
    func setScrollViewConstrains() {
        
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
        
        //contentView.addSubview(enterButton)
        
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
