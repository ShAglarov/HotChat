//
//  Delegate_TextField.swift
//  myApp
//
//  Created by Shamil Aglarov on 25.02.2023.
//

import UIKit

extension RegistrationViewControllerOne: UITextFieldDelegate {
    
    ///  Функция делает видимыми либо невидимыми добавленные элементы
    func textFieldDidBeginEditing(_ firstName: UITextField?,
                                  _ surName: UITextField?,
                                  _ dateOfBirdh: UITextField?,
                                  _ enterButton: UIButton?,
                                  _ placeholderAge: UILabel?,
                                  hide status: Bool?) {
        firstName?.isHidden = status ?? false
        surName?.isHidden = status ?? false
        dateOfBirdh?.isHidden = status ?? false
        enterButton?.isHidden = status ?? false
        placeholderAge?.isHidden = status ?? false
    }
}

extension RegistrationViewControllerTwo: UITextFieldDelegate {
    
    ///  Функция делает видимыми либо невидимыми добавленные элементы
    func textFieldDidBeginEditing(_ phoneNumberOrEmail: UITextField?,
                                  _ login: UITextField?,
                                  _ password: UITextField?,
                                  _ enterButton: UIButton?,
                                  hide status: Bool?) {
        phoneNumberOrEmail?.isHidden = status ?? false
        login?.isHidden = status ?? false
        password?.isHidden = status ?? false
        enterButton?.isHidden = status ?? false
    }
}
