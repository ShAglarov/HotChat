//
//  Extension_RegistrationVC.swift
//  myApp
//
//  Created by Shamil Aglarov on 21.02.2023.
//

import UIKit

extension RegistrationViewControllerOne {
    
    // прячем клавиатуру при нажатии на область Scroll View
    @objc func hideKeyboardAfterTouchScreen() {
        view.endEditing(true)
    }
    
    @objc func showTextFieldAfterTouchScreen() {
        textFieldDidBeginEditing(firstNameTextField,
                                 surNameTextField,
                                 dateOfBirdhTextField,
                                 enterNextButton,
                                 placeholderAgeLabel,
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
    
    //запрет на редактирование текста в dateOfBirdhTextField
    @objc private func dismissKeyboard() {
        if dateOfBirdhTextField.text?.isString == false {
            dateOfBirdhTextField.text = String()
        }
    }
    
    func formatter(date: Date) -> String {
        let formatter = DateFormatter()

        formatter.dateFormat = "dd.MM.yyyy"
        
        let birthday = formatter.date(from: formatter.string(from: date))

        let timeInterval = birthday?.timeIntervalSinceNow
        age = String(abs(Int(timeInterval! / 31556926.0)))
        placeholderAgeLabel.text = "\(age) years old"
        return formatter.string(from: date)
    }

    @objc func changeDate(datePicker: UIDatePicker) {
        dateOfBirdhTextField.text = formatter(date: datePicker.date)
        dateOfBirdhTextField.textColor = .black
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
        
        popUpErrorView.viewConfigure(addSubview: contentView,
                                     cornerRadius: 10,
                                     visible: true,
                                     backGroundColor: nil
        )
    }
    
    func elementsConfigure() {

        datePicker.addTarget(self, action: #selector(changeDate(datePicker:)), for: .valueChanged)

        datePicker.datePickerMode = .date
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = Date()

        dateOfBirdhTextField.inputView = datePicker
        dateOfBirdhTextField.text = formatter(date: Date.now)
        
        firstNameTextField.borderStyle = .roundedRect
        surNameTextField.borderStyle = .roundedRect
        dateOfBirdhTextField.borderStyle = .roundedRect
        
        firstNameTextField.addTarget(self,
                                     action: #selector(editingTextFieldTrimming(text: )),
                                     for: .editingChanged)
        surNameTextField.addTarget(self,
                                   action: #selector(editingTextFieldTrimming(text: )),
                                   for: .editingChanged)
        dateOfBirdhTextField.addTarget(self,
                                       action: #selector(dismissKeyboard),
                                       for: .editingChanged)
        
        firstNameTextField.textFieldConfigure(
            leftImageViewNamed: nil,
            textPlaceholder: "First name",
            textColor: .darkText,
            font: .italicSystemFont(ofSize: 15),
            addSubview: contentView,
            cornerRadius: nil,
            visible: true,
            backGroundColor: UIColor(patternImage:
                                        UIImage(named: "textFieldBackground")!
                                    )
        )
        
        surNameTextField.textFieldConfigure(
            leftImageViewNamed: nil,
            textPlaceholder: "Last name",
            textColor:  .darkText,
            font: .italicSystemFont(ofSize: 15),
            addSubview: contentView,
            cornerRadius: nil,
            visible: true,
            backGroundColor: UIColor(patternImage:
                                        UIImage(named: "textFieldBackground")!
                                    )
        )
        
        dateOfBirdhTextField.textFieldConfigure(
            leftImageViewNamed: nil,
            textPlaceholder: "BirthDay",
            textColor: #colorLiteral(red: 0.4322653115, green: 0.4432953, blue: 0.4431026578, alpha: 1),
            font: .italicSystemFont(ofSize: 15),
            addSubview: contentView,
            cornerRadius: nil,
            visible: true,
            backGroundColor: UIColor(patternImage:
                                        UIImage(named: "textFieldBackground")!
                                    )
        )
        
        enterNextButton.buttonConfigure(addSubview: contentView,
                                         title: "Next",
                                         cornerRadius: 5,
                                         visible: true,
                                         backGroundColor: UIColor(
                                            patternImage: UIImage(named: "buttonBackground")!),
                                        titleColor: #colorLiteral(red: 0.9435585141, green: 1, blue: 0.7481297851, alpha: 1)
        )
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
        contentView.addSubview(placeholderAgeLabel)
        
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
            // имя
            firstNameTextField.leftAnchor
                .constraint(
                    equalTo: contentView.safeAreaLayoutGuide.leftAnchor,
                    constant: const
                ),
            firstNameTextField.topAnchor
                .constraint(
                    equalTo: contentView.topAnchor,
                    constant: 25
                ),
            firstNameTextField.rightAnchor
                .constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor,
                            constant: -const
                ),
            firstNameTextField.heightAnchor
                .constraint(
                    equalToConstant: 60
                ),
            // фамилия
            surNameTextField.leadingAnchor
                .constraint(
                    equalTo: firstNameTextField.leadingAnchor
                ),
            surNameTextField.topAnchor
                .constraint(
                    equalTo: firstNameTextField.bottomAnchor,
                    constant: 13
                ),
            surNameTextField.trailingAnchor
                .constraint(
                    equalTo: firstNameTextField.trailingAnchor
                ),
            surNameTextField.heightAnchor
                .constraint(equalToConstant: 60),
            // дата рождения
            dateOfBirdhTextField.leadingAnchor
                .constraint(
                    equalTo: surNameTextField.leadingAnchor
                ),
            dateOfBirdhTextField.topAnchor
                .constraint(
                    equalTo: surNameTextField.bottomAnchor,
                    constant: 13
                ),
            dateOfBirdhTextField.trailingAnchor
                .constraint(
                    equalTo: surNameTextField.trailingAnchor
                ),
            dateOfBirdhTextField.heightAnchor
                .constraint(equalToConstant: 60
                ),
            
            placeholderAgeLabel.topAnchor
                .constraint(
                equalTo: dateOfBirdhTextField.topAnchor
                ),
            placeholderAgeLabel.centerXAnchor
                .constraint(
                    equalTo: dateOfBirdhTextField.centerXAnchor
                ),

            enterNextButton.leadingAnchor
                .constraint(
                    equalTo: dateOfBirdhTextField.leadingAnchor
                ),
            // Enter
            enterNextButton.topAnchor
                .constraint(
                    equalTo: dateOfBirdhTextField.bottomAnchor,
                    constant: 13
                ),
            enterNextButton.trailingAnchor
                .constraint(
                    equalTo: dateOfBirdhTextField.trailingAnchor
                ),
            enterNextButton.heightAnchor
                .constraint(equalToConstant: 50)

        ])
    }
}


