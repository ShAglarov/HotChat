//
//  Delegate_TextField.swift
//  myApp
//
//  Created by Shamil Aglarov on 25.02.2023.
//

import UIKit

extension RegistrationViewControllerOne: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField, status: Bool) {
        self.surNameTextField.isHidden = status
        self.firstNameTextField.isHidden = status
        self.dateOfBirdhTextField.isHidden = status
        self.enterNextButton.isHidden = status
        self.placeholderAgeLabel.isHidden = status
    }
}
