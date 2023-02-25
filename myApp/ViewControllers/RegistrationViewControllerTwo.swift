//
//  RegistrationViewControllerTwo.swift
//  myApp
//
//  Created by Shamil Aglarov on 21.02.2023.
//

import UIKit

class RegistrationViewControllerTwo: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let popUpErrorView = PopUpOnErrorView()
    let imageVeiw = UIImageView()
    let tapGesture = UITapGestureRecognizer()
    let enterButton = UIButton()
    
    var firsName = String()
    var surName = String()
    var dateOfBirdh = String()
    var age = Int()
    
    let phoneNumberOrEmailTextField = UITextField()
    let loginTextField = UITextField()
    let passwordTextField = UITextField()
    
    func inputData() throws -> (String, String, String){
        
        guard let phoneNumber = phoneNumberOrEmailTextField.text,
              !phoneNumber.isEmpty else { throw ErrorInputDataRegistratioinViewControllerTwo.errorEnterFirstName }
        
        guard let login = loginTextField.text,
              !surName.isEmpty else { throw ErrorInputDataRegistratioinViewControllerTwo.errorEnterSurName }
        
        guard let password = passwordTextField.text,
              !password.isEmpty else { throw ErrorInputDataRegistratioinViewControllerTwo.errorEnterDateOfBirdh }
        
        return (phoneNumber, login, password)
    }
    
    @objc func presentToFinishedRegistrationVC() {
        
        do {
            let (firstName, surName, dateOfBirdh) = try inputData()
            
//            let personsAccountVC = PersonsAccountViewController()
//
//            personsAccountVC.firsName = firstName
//            personsAccountVC.surName = surName
//            personsAccountVC.dateOfBirdh = dateOfBirdh
//            personsAccountVC.age = self.age
            
            navigationController?.popToRootViewController(animated: true)
            
        } catch {
            textFieldDidBeginEditing(phoneNumberOrEmailTextField,
                                     loginTextField,
                                     passwordTextField,
                                     enterButton,
                                     hide: true)
            
            textViewDidBeginEditing(PopUpOnErrorView(), status: false)
            setPopUpErrorViewConstrains(errorText: error.localizedDescription)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneNumberOrEmailTextField.delegate = self
        
        viewsConfigure()
        setScrollViewConstrains()
        elementsConfigure()
        setViewElementsConstraints()
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // второе, когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        enterButton.addTarget(self, action: #selector(presentToFinishedRegistrationVC), for: .touchUpInside)
        
        let popUPOnErrorView = PopUpOnErrorView()
        
        popUpErrorView.enterButton.addTarget(self,
                              action: #selector(showTextFieldAfterTouchScreen),
                              for: .touchUpInside)
    }
    
    func scrollUp() {
        
        //проверка поворота экрана если она горизонтальная то сдвигаем scrollView немного вверх
        guard self.preferredInterfaceOrientationForPresentation.isLandscape == true else { return }
        scrollView.setContentOffset(CGPoint(x: 0, y: view.bounds.height / 4), animated: true)
    }

}



