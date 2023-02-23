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
    let imageVeiw = UIImageView()
    let tapGesture = UITapGestureRecognizer()
    let enterButton = UIButton()
    
    var firsName = String()
    var surName = String()
    var dateOfBirdh = String()
    var age = String()
    
    let phoneNumberOrEmailTextField = UITextField()
    let loginTextField = UITextField()
    let passwordTextField = UITextField()
    
    var didRegister: (Person) -> Void = { person in }

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        enterButton.addTarget(self, action: #selector(backToMainVC), for: .touchUpInside)
    }
    
    func scrollUp() {
        
        //проверка поворота экрана если она горизонтальная то сдвигаем scrollView немного вверх
        guard self.preferredInterfaceOrientationForPresentation.isLandscape == true else { return }
        scrollView.setContentOffset(CGPoint(x: 0, y: view.bounds.height / 4), animated: true)
    }
    
    @objc func backToMainVC() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func createPerson() -> Person {
        guard let phoneOrEmail = phoneNumberOrEmailTextField.text,
              let login = loginTextField.text,
              let password = passwordTextField.text else { return Person() }
        
        let person = Person(fistName: firsName,
                            surName: surName,
                            dateOfBirdh: dateOfBirdh,
                            age: Int(age) ?? 0,
                            phoneNumberOrEmail: phoneOrEmail,
                            login: login,
                            password: password
        )
        
        return person
    }

}


