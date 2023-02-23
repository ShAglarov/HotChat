//
//  Extension_RegistrationVC.swift
//  myApp
//
//  Created by Shamil Aglarov on 21.02.2023.
//

import UIKit

extension RegistrationViewControllerTwo {
    
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
        
        phoneNumberOrEmailTextField.borderStyle = .roundedRect
        loginTextField.borderStyle = .roundedRect
        passwordTextField.borderStyle = .roundedRect
        
        phoneNumberOrEmailTextField.addTarget(self, action: #selector(editingTextFieldLowerased(text: )), for: .editingChanged)
        phoneNumberOrEmailTextField.addTarget(self, action: #selector(editingTextFieldTrimming(text: )), for: .editingChanged)
        loginTextField.addTarget(self, action: #selector(editingTextFieldTrimming(text: )), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(editingTextFieldTrimming(text: )), for: .editingChanged)
        
        passwordTextField.isSecureTextEntry = true
        
        phoneNumberOrEmailTextField.textFieldConfigure(
            leftImageViewNamed: nil,
            textPlaceholder: "Phone number or email adress",
            textColor: .darkText,
            font: .italicSystemFont(ofSize: 15),
            addSubview: contentView,
            cornerRadius: nil,
            visible: true,
            backGroundColor: UIColor(patternImage:
                                        UIImage(named: "textFieldBackground")!
                                    )
        )
        
        loginTextField.textFieldConfigure(
            leftImageViewNamed: nil,
            textPlaceholder: "Login",
            textColor: .darkText,
            font: .italicSystemFont(ofSize: 15),
            addSubview: contentView,
            cornerRadius: nil,
            visible: true,
            backGroundColor: UIColor(patternImage:
                                        UIImage(named: "textFieldBackground")!
                                    )
        )
        
        passwordTextField.textFieldConfigure(
            leftImageViewNamed: nil,
            textPlaceholder: "Password",
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
                                         title: "Create account",
                                         cornerRadius: 5,
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
            
            phoneNumberOrEmailTextField.leftAnchor
                .constraint(
                    equalTo: contentView.safeAreaLayoutGuide.leftAnchor,
                    constant: const
                ),
            phoneNumberOrEmailTextField.topAnchor
                .constraint(
                    equalTo: contentView.topAnchor,
                    constant: 25
                ),
            phoneNumberOrEmailTextField.rightAnchor
                .constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor,
                            constant: -const
                ),
            phoneNumberOrEmailTextField.heightAnchor
                .constraint(
                    equalToConstant: 60
                ),
            loginTextField.leadingAnchor
                .constraint(
                    equalTo: phoneNumberOrEmailTextField.leadingAnchor
                ),
            loginTextField.topAnchor
                .constraint(
                    equalTo: phoneNumberOrEmailTextField.bottomAnchor,
                    constant: 13
                ),
            loginTextField.trailingAnchor
                .constraint(
                    equalTo: phoneNumberOrEmailTextField.trailingAnchor
                ),
            loginTextField.heightAnchor
                .constraint(equalToConstant: 60),
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
                .constraint(equalToConstant: 50)

        ])
    }
}

