//
//  Delegate_View.swift
//  myApp
//
//  Created by Shamil Aglarov on 25.02.2023.
//

import UIKit

extension RegistrationViewControllerOne: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: PopUpOnErrorView, status: Bool) {
        self.popUpErrorView.isHidden = status
    }
}

extension RegistrationViewControllerTwo: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: PopUpOnErrorView, status: Bool) {
        self.popUpErrorView.isHidden = status
    }
}

extension MainViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: PopUpOnErrorView, status: Bool) {
        self.popUpErrorView.isHidden = status
    }
}
