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
    
    @objc func showTextFieldAfterTouchScreen() {
        textFieldDidBeginEditing(loginTextField,
                                 passwordTextField,
                                 enterButton,
                                 hide: false)
    }
    
    @objc func hidePopUpErrorViewAfterTouchScreen() {
        textViewDidBeginEditing(popUpErrorView, status: true)
    }
    
    @objc func showPopUpErrorViewAfterTouchScreen() {
        textViewDidBeginEditing(popUpErrorView, status: false)
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
    
    /// во время редактирования текста запрещаем  буквы с верхним регистром
    @objc func editingTextFieldLowerased(text: UITextField) {
        text.lowercasedText()
    }
    
    /// во время редактирования текста запрещаем  ставить пробелы
    @objc func editingTextFieldTrimming(text: UITextField) {
        text.trimmingWiteSpacesText()
    }
    
    func viewsConfigure() {
        
        view.backgroundColor = UIColor(
            patternImage: UIImage(named: "viewBackground")!
        )
        
        imageVeiw.image = UIImage(named: "headerBackground")
        imageVeiw.contentMode = .topRight
        imageVeiw.translatesAutoresizingMaskIntoConstraints = false
        
        tapGesture.addTarget(self, action: #selector(hideKeyboardAfterTouchScreen))
        tapGesture.addTarget(self, action: #selector(showTextFieldAfterTouchScreen))
        tapGesture.addTarget(self, action: #selector(hidePopUpErrorViewAfterTouchScreen))
        
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
        
        popUpErrorView.viewConfigure(addSubview: scrollView,
                                     cornerRadius: 10,
                                     visible: true,
                                     backGroundColor: nil
        )
    }
    
    func elementsConfigure() {
        
        loginTextField.addTarget(self, action: #selector(editingTextFieldLowerased(text: )), for: .editingChanged)
        loginTextField.addTarget(self, action: #selector(editingTextFieldTrimming(text: )), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(editingTextFieldTrimming(text: )), for: .editingChanged)
        
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
                                    titleColor: #colorLiteral(red: 0.9435585141, green: 1, blue: 0.7481297851, alpha: 1)
        )
        
        registrationButton.buttonConfigure(addSubview: contentView,
                                         title: "Register account",
                                         cornerRadius: 20,
                                         visible: true,
                                         backGroundColor: UIColor(
                                            patternImage: UIImage(named: "buttonBackground")!),
                                           titleColor: #colorLiteral(red: 0.9435585141, green: 1, blue: 0.7481297851, alpha: 1)
        )
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
    
    func setPopUpErrorViewConstrains(errorText: String) {
        
        popUpErrorView.textError.text = errorText

        let const: CGFloat = 20
        
        NSLayoutConstraint.activate([
            popUpErrorView.leftAnchor
                .constraint(
                    equalTo: contentView.safeAreaLayoutGuide.leftAnchor,
                    constant: const
                ),
            popUpErrorView.topAnchor
                .constraint(
                    equalTo: contentView.topAnchor,
                    constant: 70
                ),
            popUpErrorView.rightAnchor
                .constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor,
                            constant: -const
                ),
            popUpErrorView.heightAnchor
                .constraint(
                    equalToConstant: 140
                ),
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
                    equalTo: view.bottomAnchor,
                    constant: -100
                ),
            registrationButton.heightAnchor
                .constraint(equalToConstant: 35)
        ])
    }
}
