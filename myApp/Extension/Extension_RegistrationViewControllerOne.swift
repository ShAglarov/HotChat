//
//  Extension_RegistrationVC.swift
//  myApp
//
//  Created by Shamil Aglarov on 21.02.2023.
//

import UIKit

extension RegistrationViewControllerOne {
    
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

        datePicker.addTarget(self, action: #selector(changeDate(datePicker:)), for: .valueChanged)

        datePicker.datePickerMode = .date
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = Date()

        dateOfBirdhTextField.inputView = datePicker
        dateOfBirdhTextField.textFieldConfigure(leftImageViewNamed: nil,
            textPlaceholder: "Enter your date of birdh (\(age) years old)",
            textColor: .darkText,
            font: UIFont.italicSystemFont(ofSize: 15),
            addSubview: contentView,
            cornerRadius: nil,
            visible: true,
            backGroundColor: UIColor(patternImage:
                                        UIImage(named: "textFieldBackground")!)
        )
        
        firstNameTextField.borderStyle = .roundedRect
        surNameTextField.borderStyle = .roundedRect
        dateOfBirdhTextField.borderStyle = .roundedRect
        
        firstNameTextField.addTarget(self, action: #selector(editingTextFieldTrimming(text: )), for: .editingChanged)
        surNameTextField.addTarget(self, action: #selector(editingTextFieldTrimming(text: )), for: .editingChanged)
        dateOfBirdhTextField.addTarget(self, action: #selector(dismissKeyboard), for: .editingChanged)
        
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
            textColor: .darkText,
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
                                         title: "Next",
                                         cornerRadius: 5,
                                         visible: true,
                                         backGroundColor: UIColor(
                                            patternImage: UIImage(named: "buttonBackground")!),
                                         tintColor: .darkText)
        
    }
    
    func addPopUpError(visible: Bool) {
        
        popUpViewErrorView.viewConfigure(addSubview: scrollView,
                                         cornerRadius: 10.0,
                                         visible: visible,
                                         backGroundColor: .systemYellow)
        
        NSLayoutConstraint.activate([
            popUpViewErrorView.leftAnchor
                .constraint(
                    equalTo: contentView.leftAnchor,
                    constant: 100
                ),
            popUpViewErrorView.rightAnchor
                .constraint(
                    equalTo: contentView.rightAnchor,
                    constant: -100
                ),
            popUpViewErrorView.topAnchor
                .constraint(
                    equalTo: contentView.topAnchor,
                    constant: 50
                ),
            popUpViewErrorView.heightAnchor
                .constraint(equalToConstant: 100)
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

            enterButton.leadingAnchor
                .constraint(
                    equalTo: dateOfBirdhTextField.leadingAnchor
                ),
            // Enter
            enterButton.topAnchor
                .constraint(
                    equalTo: dateOfBirdhTextField.bottomAnchor,
                    constant: 13
                ),
            enterButton.trailingAnchor
                .constraint(
                    equalTo: dateOfBirdhTextField.trailingAnchor
                ),
            enterButton.heightAnchor
                .constraint(equalToConstant: 50)

        ])
    }
}


