//
//  Delegate_TextField.swift
//  myApp
//
//  Created by Shamil Aglarov on 25.02.2023.
//

import UIKit

extension RegistrationViewControllerOne: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ firstName: UITextField?,
                                  _ surName: UITextField?,
                                  _ dateOfBirdh: UITextField?,
                                  _ enterButton: UIButton?,
                                  _ placeholderAge: UILabel?,
                                  _ status: Bool?) {
        firstName?.isHidden = status ?? false
        surName?.isHidden = status ?? false
        dateOfBirdh?.isHidden = status ?? false
        enterButton?.isHidden = status ?? false
        placeholderAge?.isHidden = status ?? false
    }
}
